import 'dart:developer';
import 'dart:typed_data';
import '../controller/user_detial_bar_controller.dart';
import '../model/order_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../controller/user_auth_screen_controller.dart';
import '../core/utils.dart';
import '../model/product_model.dart';
import '../model/review_model.dart';
import '../model/user_model.dart';

class AppService {
  //firestore instance.
  final _firebaseFirestore = FirebaseFirestore.instance;
  //firebaseAuth instance.
  final _firebaseAuth = FirebaseAuth.instance;

  //! sigup User Function ==>
  Future<bool> sigUpUser({
    required String username,
    required String email,
    required String password,
    required String address,
  }) async {
    // firebase cloud firestore instance
    final CollectionReference _collectionReference =
        _firebaseFirestore.collection('users');

    try {
      Get.find<UserAuthScreenController>().buttonLoading.value = true;
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //upload user detials to firestore
      await _collectionReference
          .doc(_firebaseAuth.currentUser?.uid)
          .set({
            "name": username,
            "address": address,
          })
          .then((value) => log("User Added"))
          .catchError((error) => log("Failed to add user: $error"));

      // snackBar
      AppUtils.snackBar(
        title: 'Authentication Message',
        content: 'Your Amazon account has been created.',
      );

      return true;
    } on FirebaseAuthException catch (e) {
      // snackBar
      AppUtils.snackBar(
        title: 'Authentication Message',
        content: e.message.toString(),
      );

      log(e.message.toString());
      log(e.toString());
      return false;
    }
  } //!<==

  //!sign in User Function ==>
  Future<bool> sigInUser({
    required String email,
    required String password,
  }) async {
    try {
      Get.find<UserAuthScreenController>().buttonLoading.value = true;

      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUtils.snackBar(
        title: 'Authentication Message',
        content: 'Your Amazon account has been logged in .',
      );

      return true;
    } on FirebaseAuthException catch (e) {
      Get.find<UserAuthScreenController>().buttonLoading.value = false;
      AppUtils.snackBar(
        title: 'Authentication Message',
        content: e.message.toString(),
      );
      log(e.message.toString());
      return false;
    }
  } //!<==

  //!getProduct from FirebaseFirestore==>
  Future<List<ProductModel>> getProduct() async {
    var querySnapshot = await _firebaseFirestore.collection('products').get();

    List<ProductModel> productModel = querySnapshot.docs
        .map((docSnapshot) => ProductModel.fromJson(json: docSnapshot.data()))
        .toList();
    return productModel;
  } //!<==

  //!uploadProduct to FirebaseFirestore==>
  Future<void> uploadProductToDB({
    required String productName,
    required Uint8List? imageUrl,
    required double? price,
    required int? discount,
    required String sellerName,
    required String sellerUid,
  }) async {
    if (productName.isNotEmpty && price != null && imageUrl != null) {
      try {
        //uid
        final uid = AppUtils.uid();
        // uploadLoadProductImageDB function .
        String? url = await _uploadProductImageDB(
          image: imageUrl,
          uid: uid,
        );

        // get proudctmodel and set data .
        final productModel = ProductModel(
          uid: uid,
          productName: productName,
          imageUrl: url!,
          price: price,
          discount: discount!,
          discountPrice: price - (price * (discount / 100)),
          sellerName: sellerName,
          sellerUid: sellerUid,
          ratingCount: 5,
          rating: 5,
          itemCount: 1,
        );

        // add to FirebaseFirestore
        await _firebaseFirestore
            .collection('products')
            .doc(uid)
            .set(productModel.toJson())
            .then((value) {
          AppUtils.snackBar(
            title: 'Amazon',
            content: 'product add scucessfully',
          );
        });
      } on FirebaseException catch (e) {
        // app error snackBar

        AppUtils.snackBar(
          title: 'App error',
          content: e.message.toString(),
        );
        log(e.toString());
        // user error snackBar

        AppUtils.snackBar(
          title: 'Amazon',
          content: "Please make sure all the fields are not empty",
        );
      }
    }
  } //!<==

  //! upload ProductImageDB==>
  Future<String?> _uploadProductImageDB({
    required Uint8List image,
    required String uid,
  }) async {
    try {
      //FirebaseStorage instance & create folder path.
      Reference storageReference =
          FirebaseStorage.instance.ref().child('products').child(uid);
      //put image to FirebaseStorage
      UploadTask uploadTask = storageReference.putData(image);
      TaskSnapshot task = await uploadTask;
      //return get download image url
      return await task.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      log(
        e.message.toString(),
      );
      return null;
    }
  } //!<==

  //!uploadReview==>
  Future<void> uploadReview(
      {required String uid, required ReviewModel reviewModel}) async {
    await _firebaseFirestore
        .collection('products')
        .doc(uid)
        .collection('reviews')
        .add(
          reviewModel.toJson(),
        );
    await averageProductRating(productUid: uid, reviewModel: reviewModel);
  } //!<==

  //!get user detials from firebasefireStore.
  Future<UserModel> getUserData() async {
    DocumentSnapshot userData = await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .get();

    //json data  converted to model object.
    UserModel userDetials = UserModel.fromJson(userData.data() as dynamic);

    return userDetials;
  } //!<==

  //! Product add to cart==>
  Future<void> addToCart({required ProductModel productModel}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("cart")
          .doc(productModel.uid)
          .set(productModel.toJson());
      AppUtils.snackBar(
        title: 'Amazon',
        content: "Product successfully added to your shopping cart",
      );
    } on FirebaseAuthException catch (e) {
      AppUtils.snackBar(
        title: 'Amazon',
        content: e.message.toString(),
      );
    }
  }
  //!<==

  //! update Product from cart==>
  Future<void> updateToCart({required ProductModel productModel}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("cart")
          .doc(productModel.uid)
          .set(productModel.toJson());
    } on FirebaseAuthException catch (e) {
      AppUtils.snackBar(
        title: 'Amazon',
        content: e.message.toString(),
      );
    }
  }
  //!<==

  //! Delete Product from cart==>

  Future<void> deleteProductFromCart({required String uid}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("cart")
          .doc(uid)
          .delete();
      AppUtils.snackBar(
        title: 'Amazon',
        content: "Product delete from shopping cart",
      );
    } on FirebaseAuthException catch (e) {
      AppUtils.snackBar(
        title: 'Amazon',
        content: e.message.toString(),
      );
    }
  }

  //!<==

  //! Buy all Products from cart==>
  Future<void> buyAllItemInCart() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('cart')
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      final productModel =
          ProductModel.fromJson(json: querySnapshot.docs[i].data());
      addProductToOder(
        productModel: productModel,
      );
    }
  }
  //!<==

  //! addProductToOder from cart==>
  Future<void> addProductToOder({required ProductModel productModel}) async {
    try {
      _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('orders')
          .add(productModel.toJson());

      _sendOderRequest(
        productModel: productModel,
      );

      _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("cart")
          .doc(productModel.uid)
          .delete();
    } on FirebaseAuthException catch (e) {
      AppUtils.snackBar(
        title: 'Amazon',
        content: e.message.toString(),
      );
    }
  }
  //!<==

  //! addProductToOder from cart==>

  Future<void> _sendOderRequest({
    required ProductModel productModel,
  }) async {
    final orderRequestModel = OrderRequestModel(
      productName: productModel.productName,
      buyerName: Get.find<UserDetialController>().userDetials().username,
      buyerAddress: Get.find<UserDetialController>().userDetials().address,
    );
    await _firebaseFirestore
        .collection("users")
        .doc(productModel.sellerUid)
        .collection("orderRequest")
        .add(orderRequestModel.toJson());
  }

  //!<==

  //! product Average rating ==>
  Future<void> averageProductRating(
      {required String productUid, required ReviewModel reviewModel}) async {
    DocumentSnapshot documentSnapshot =
        await _firebaseFirestore.collection("products").doc(productUid).get();

    final productModel = ProductModel.fromJson(
        json: documentSnapshot.data() as Map<String, dynamic>);

    int currentRating = productModel.ratingCount;
    double newrating = (currentRating + reviewModel.rating) / 2;

    await _firebaseFirestore
        .collection("products")
        .doc(productUid)
        .update({"rating": newrating});
  }

  //!<==

}

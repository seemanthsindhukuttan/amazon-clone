import 'dart:developer';
import 'dart:typed_data';
import '../core/utils.dart';
import '../model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SellProductService {
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
        String uid = AppUtils.uid();
        // uploadLoadProductImageDB function .
        String? url = await _uploadLoadProductImageDB(
          image: imageUrl,
          uid: uid,
        );

        // - (price * (discount! / 100)),
        // get proudctmodel and set data .
        final productModel = ProductModel(
          uid: uid,
          productName: productName,
          imageUrl: url!,
          price: price,
          discount: discount!,
          sellerName: sellerName,
          sellerUid: sellerUid,
          ratingCount: 5,
          rating: 0,
        );

        // add to FirebaseFirestore
        await FirebaseFirestore.instance
            .collection('products')
            .doc(uid)
            .set(productModel.toJson())
            .then((value) {
          AppUtils.snackBar(
            title: 'App error',
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
          title: 'User error',
          content: "Please make sure all the fields are not empty",
        );
      }
    }
  }

  Future<String?> _uploadLoadProductImageDB({
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
  }
}

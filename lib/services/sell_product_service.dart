import 'dart:developer';
import 'dart:typed_data';
import 'package:amazon_clone/core/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SellProductService {
  Future uploadProductToDB({
    required String productName,
    required Uint8List? imageUrl,
    required double? price,
    required int? discount,
    required String sellerName,
    required String sellerUid,
  }) async {
    if (productName.isNotEmpty && price != null && imageUrl != null) {
      log('validated');
    } else {
      AppUtils.snackBar(
        title: 'User error',
        content: "Please make sure all the fields are not empty",
      );
    }
  }
}

Future<void> uploadLoadProductImageDB(
    {required Uint8List image, required String uid}) async {
  try {
    Reference storageReference =
        FirebaseStorage.instance.ref().child('products').child(uid);
    UploadTask uploadTask = storageReference.putData(image);
    TaskSnapshot task = await uploadTask;
  } on FirebaseException catch (e) {
    log(
      e.message.toString(),
    );
  }
}

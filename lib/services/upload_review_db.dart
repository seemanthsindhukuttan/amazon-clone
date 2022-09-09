import 'package:amazon_clone/model/review_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class UploadReview {
  Future<void> uploadReview(
      {required String uid, required ReviewModel reviewModel}) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(uid)
        .collection('reviews')
        .add(
          reviewModel.toJson(),
        );
  }
}

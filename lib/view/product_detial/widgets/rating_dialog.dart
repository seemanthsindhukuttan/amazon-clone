import 'dart:developer';
import '../../../controller/user_detial_bar_controller.dart';
import '../../../model/review_model.dart';
import '../../../services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingDialogWidget extends StatelessWidget {
  const RatingDialogWidget({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      title: const Text(
        'Type review for this product',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      submitButtonText: 'Submit',
      commentHint: 'Add comment ',
      onSubmitted: (RatingDialogResponse response) async {
        if (response.rating != null && response.comment != null) {
          await AppService().uploadReview(
            uid: uid,
            reviewModel: ReviewModel(
              reviewerName:
                  Get.find<UserDetialController>().userDetials().username,
              description: response.comment,
              rating: response.rating,
            ),
          );

          log('rating: ${response.rating}, comment: ${response.comment}');
        }
      },
    );
  }
}

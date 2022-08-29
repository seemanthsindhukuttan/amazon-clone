import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingDialogWidget extends StatelessWidget {
  const RatingDialogWidget({Key? key}) : super(key: key);

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
      onSubmitted: (response) {
        log('rating: ${response.rating}, comment: ${response.comment}');
      },
    );
  }
}

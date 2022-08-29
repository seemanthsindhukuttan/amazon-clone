import 'package:amazon_clone/core/constants.dart';
import 'package:amazon_clone/view/search_result/widgets/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors.dart';

class ProductReviewWidget extends StatelessWidget {
  const ProductReviewWidget({
    Key? key,
    required this.customerName,
    required this.comments,
    required this.rating,
  }) : super(key: key);
  final String customerName;
  final String comments;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          customerName,
          style: GoogleFonts.aBeeZee(
            color: UiColors.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 3.0,
          ),
          child: Row(
            children: [
              RatingStarWidget(
                rating: rating,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                rating == 1
                    ? AppConstants.keyOfReview[0]
                    : rating == 2
                        ? AppConstants.keyOfReview[1]
                        : rating == 3
                            ? AppConstants.keyOfReview[2]
                            : rating == 4
                                ? AppConstants.keyOfReview[3]
                                : rating == 5
                                    ? AppConstants.keyOfReview[4]
                                    : AppConstants.keyOfReview[5],
                style: GoogleFonts.aBeeZee(
                  color: UiColors.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Text(
          comments,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.aBeeZee(
            color: UiColors.blackColor,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

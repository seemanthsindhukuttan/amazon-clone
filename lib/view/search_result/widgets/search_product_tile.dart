import 'package:amazon_clone/view/search_result/widgets/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors.dart';

class SearchProductTile extends StatelessWidget {
  final VoidCallback ontap;
  const SearchProductTile({
    Key? key,
    required this.ontap,
    required this.price,
    required this.brandName,
    required this.productImage,
    required this.productDetials,
    required this.ratingStar,
    required this.ratingCount,
  }) : super(key: key);
  final int price;
  final String brandName;
  final Image productImage;
  final String productDetials;
  final int ratingStar;
  final double ratingCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: productImage),
            Text(
              brandName,
              style: GoogleFonts.aBeeZee(
                color: UiColors.blackColor,
                fontSize: 18,
              ),
            ),
            Text(
              productDetials,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.aBeeZee(
                color: UiColors.blackColor,
                fontSize: 13,
              ),
            ),
            const RatingStarWidget(
              rating: 1,
            ),
            Text(
              '₹ $price',
              textAlign: TextAlign.center,
              style: GoogleFonts.aBeeZee(
                color: UiColors.blackColor,
                fontSize: 25,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check,
                  color: UiColors.primaryColor,
                ),
                Text(
                  'Prime',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aBeeZee(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'FREE Delivery by Amazon',
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  color: UiColors.greyLight,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

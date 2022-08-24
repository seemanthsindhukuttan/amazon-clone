import 'package:amazon_clone/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors.dart';

class CategoryListViewBar extends StatelessWidget {
  const CategoryListViewBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: AppConstants.kAppBarHeight * 1.2,
      width: AppConstants.screenSize.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppConstants.categoriesList.length,
        itemBuilder: (context, index) => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 45,
                right: 10,
              ),
              child: CircleAvatar(
                minRadius: 23,
                backgroundImage: AssetImage(
                  AppConstants.categoryLogos[index],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 2,
                right: 10,
              ),
              child: Text(
                AppConstants.categoriesList[index],
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.w500,
                  color: UiColors.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

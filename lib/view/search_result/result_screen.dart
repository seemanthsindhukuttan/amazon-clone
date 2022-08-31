import 'package:amazon_clone/core/colors.dart';
import 'package:amazon_clone/core/constants.dart';
import 'package:amazon_clone/view/home/widgets/search_bar_widget.dart';
import 'package:amazon_clone/view/product_detial/product_detial_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/search_product_tile.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.query,
  }) : super(key: key);

  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(AppConstants.kAppBarHeight),
          child: SearchBarWidget(
            isReadOnly: false,
            autofocus: false,
            showBackButton: true,
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Showing result for ',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      color: UiColors.activeCyanColor,
                    ),
                  ),
                  TextSpan(
                    text: query,
                    style: GoogleFonts.aBeeZee(
                      color: UiColors.blackColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: AppConstants.screenSize.width /
                    (AppConstants.screenSize.height / 1.3),
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return SearchProductTile(
                  ontap: () {
                    Get.to(const ProductDetialScreen(
                      sellerName: 'seemanth',
                      productName: 'nike shoe',
                      price: 1000,
                      imageUrl: 'assets/nike_shoe.jpg',
                      reviewerName: 'liya',
                      rating: 4,
                      comments: 'good product',
                      custmorRating: 4,
                    ));
                  },
                  price: 1000,
                  brandName: 'nike',
                  productImage: Image.asset('assets/nike_shoe.jpg'),
                  productDetials: 'jjdjjdhhdhhdhhuuusbsuixb',
                  ratingStar: 3,
                  ratingCount: 3,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
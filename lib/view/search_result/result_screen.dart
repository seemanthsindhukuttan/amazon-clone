// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:amazon_clone/core/utils.dart';
import 'package:amazon_clone/model/product_model.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../widgets/search_bar_widget.dart';
import '../product_detial/product_detial_screen.dart';
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
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('products')
                  .where("productName", isEqualTo: query)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: AppUtils.appCircularProgressIndicator);
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'Oops!! Product isn\'t unavailable',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        color: UiColors.activeCyanColor,
                      ),
                    ),
                  );
                } else {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: AppConstants.screenSize.width /
                          (AppConstants.screenSize.height * 0.9),
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final producModel = ProductModel.fromJson(
                          json: snapshot.data!.docs[index].data());

                      return SearchProductTile(
                        ontap: () {
                          Get.to(
                            ProductDetialScreen(productModel: producModel),
                          );
                        },
                        price: producModel.price,
                        productImage: producModel.imageUrl,
                        productDetials: producModel.productName,
                        ratingStar: producModel.rating,
                        ratingCount: producModel.ratingCount,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../view/search_result/result_screen.dart';
import '../../widgets/search_bar_widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppConstants.kAppBarHeight),
        child: SearchBarWidget(),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: AppConstants.screenSize.width /
              2.5 /
              (AppConstants.screenSize.height / 5),
        ),
        itemCount: AppConstants.categoryLogos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: GestureDetector(
              onTap: () {
                Get.to(
                  ResultScreen(
                    query: AppConstants.categoriesList[index],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppConstants.categoryLogos[index],
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      AppConstants.categoriesList[index],
                      style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: UiColors.blackColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

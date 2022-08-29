import 'package:amazon_clone/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors.dart';

class ProductShowCaseListView extends StatelessWidget {
  const ProductShowCaseListView({
    Key? key,
    required this.title,
    required this.listView,
    this.onTap,
  }) : super(key: key);
  final String title;
  final ListView listView;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 0, top: 10),
        child: Container(
          height: AppConstants.screenSize.height / 3,
          width: AppConstants.screenSize.width,
          decoration: BoxDecoration(
            color: UiColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 8),
                    child: Text(
                      title,
                      style: GoogleFonts.montserrat(
                        height: 1.5,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 8),
                    child: Text(
                      'Show more',
                      style: GoogleFonts.aBeeZee(
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: UiColors.activeCyanColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: listView,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

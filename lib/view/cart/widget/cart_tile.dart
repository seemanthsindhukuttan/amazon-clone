import 'square_button_widget.dart';
import 'text_square_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors.dart';
import '../../../core/constants.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget({
    Key? key,
    required this.productName,
    required this.price,
    required this.buyerName,
    required this.imageUrl,
    required this.deletebutton,
    required this.saveForLaterbutton,
    required this.productIncrementButton,
    required this.productdecrementButton,
    required this.seenMoreLikeThisButton,
  }) : super(key: key);

  final String productName;
  final String imageUrl;
  final String price;
  final String buyerName;
  final VoidCallback deletebutton;
  final VoidCallback saveForLaterbutton;
  final VoidCallback productIncrementButton;
  final VoidCallback productdecrementButton;
  final VoidCallback seenMoreLikeThisButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: UiColors.whiteBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppConstants.screenSize.width / 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(height: 150, width: 150, imageUrl),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: AppConstants.screenSize.width / 20,
                        top: AppConstants.screenSize.height / 60,
                        right: AppConstants.screenSize.width / 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                          ),
                          SizedBox(
                            height: AppConstants.screenSize.height / 60,
                          ),
                          Text(
                            '₹ $price',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: UiColors.blackColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Text(
                                  'Sold by',
                                  style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.w800,
                                    color: UiColors.greyLight,
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  buyerName,
                                  style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.w800,
                                    color: UiColors.activeCyanColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    height: AppConstants.screenSize.height / 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconSquareButton(
                          onTap: productdecrementButton,
                          icon: Icons.delete_outline,
                        ),
                        Container(
                          decoration:
                              BoxDecoration(border: Border.all(width: 0.1)),
                          height: AppConstants.screenSize.height / 35,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Text(
                              '100',
                              maxLines: 1,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        IconSquareButton(
                          onTap: productIncrementButton,
                          icon: Icons.add,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    children: [
                      TextSquareButton(
                        label: 'Delete',
                        onTap: deletebutton,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextSquareButton(
                        label: 'Save for later',
                        onTap: saveForLaterbutton,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: seenMoreLikeThisButton,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Text(
                  'Seen more like this',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: UiColors.activeCyanColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

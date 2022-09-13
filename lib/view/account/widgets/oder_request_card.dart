// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors.dart';

class OrderRequestCart extends StatelessWidget {
  const OrderRequestCart({
    Key? key,
    required this.productName,
    required this.buyerName,
    required this.buyerAddress,
    required this.trailingButton,
  }) : super(key: key);

  final String productName;
  final String buyerName;
  final String buyerAddress;
  final VoidCallback trailingButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 5,
        top: 10,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ListTile(
            title: Text(
              'Order: $productName',
              style: GoogleFonts.aBeeZee(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: UiColors.blackColor,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Buyer name: $buyerName',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: UiColors.greyLight,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Address: $buyerAddress',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: UiColors.greyLight,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: trailingButton,
              icon: const Icon(
                Icons.check,
              ),
            )),
      ),
    );
  }
}

import 'package:amazon_clone/core/constants.dart';
import 'package:flutter/material.dart';

class ProductShowCardWidget extends StatelessWidget {
  const ProductShowCardWidget({
    Key? key,
    required this.image,
    required this.productName,
  }) : super(key: key);

  final String image;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
          child: Text(
            productName,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 15),
          child: Image.asset(
            height: AppConstants.screenSize.height * 0.2,
            image,
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class ProductShowCardWidget extends StatelessWidget {
  const ProductShowCardWidget({
    Key? key,
    required this.image,
    required this.productName,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String productName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: AppConstants.screenSize.width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
              child: Text(
                productName,
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: Image.network(
                height: AppConstants.screenSize.height * 0.2,
                image,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

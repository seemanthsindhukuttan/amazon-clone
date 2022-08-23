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
    return SizedBox(
      height: 200,
      width: 180,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productName,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 15),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}

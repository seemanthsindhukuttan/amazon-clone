import 'package:flutter/material.dart';

class RatingStarWidget extends StatelessWidget {
  final int rating;
  final double ratingCount;
  const RatingStarWidget(
      {Key? key, required this.rating, required this.ratingCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < 5; i++) {
      children.add(
        i < rating
            ? const Icon(
                Icons.star,
                color: Colors.orange,
              )
            : const Icon(
                Icons.star_outline,
                color: Colors.orange,
              ),
      );
    }
    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Text(
          ratingCount.toString(),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}

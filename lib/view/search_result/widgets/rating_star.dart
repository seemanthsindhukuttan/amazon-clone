import 'package:flutter/material.dart';

class RatingStarWidget extends StatelessWidget {
  final double rating;

  const RatingStarWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);

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
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          rating.toString(),
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

import 'package:amazon_clone/core/colors.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class TextSquareButton extends StatelessWidget {
  const TextSquareButton({Key? key, required this.onTap, required this.label})
      : super(key: key);
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppConstants.screenSize.height / 35,
        // width: AppConstants.screenSize.width / 6,
        decoration: BoxDecoration(
          color: UiColors.backgroundColor,
          border: Border.all(
            width: 0.1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}

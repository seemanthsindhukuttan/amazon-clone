import 'package:amazon_clone/core/colors.dart';
import 'package:flutter/material.dart';

class IconSquareButton extends StatelessWidget {
  const IconSquareButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        color: UiColors.backgroundColor,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            size: 15,
          ),
        ),
      ),
    );
  }
}

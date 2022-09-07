import '../core/colors.dart';
import 'package:flutter/material.dart';

class GradientElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final Color bodercolor;

  const GradientElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.bodercolor = Colors.transparent,
    this.borderRadius,
    this.width = double.infinity,
    this.height = 45,
    this.gradient = const LinearGradient(
      colors: UiColors.primaryButtonGradient,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: bodercolor),
            borderRadius: borderRadius,
          ),
        ),
        child: child,
      ),
    );
  }
}

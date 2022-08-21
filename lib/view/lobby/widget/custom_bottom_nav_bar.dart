import 'package:flutter/material.dart';
import '../../../core/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {Key? key, required this.tabs, this.onTap, required this.indicatorColor})
      : super(key: key);
  final List<Widget> tabs;
  final void Function(int)? onTap;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: UiColors.greyLight,
            width: 1.5,
          ),
        ),
      ),
      child: TabBar(
        indicatorColor: indicatorColor,
        indicatorSize: TabBarIndicatorSize.label,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        indicator: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: indicatorColor,
              width: 4.0,
            ),
          ),
        ),
        onTap: onTap,
        tabs: tabs,
      ),
    );
  }
}

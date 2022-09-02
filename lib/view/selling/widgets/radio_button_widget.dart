import 'package:amazon_clone/core/constants.dart';
import 'package:flutter/material.dart';
import '../../../core/colors.dart';

class RadioButtonWidget extends StatelessWidget {
  const RadioButtonWidget({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
  }) : super(key: key);
  final dynamic value;
  final dynamic groupValue;
  final String label;
  final void Function(dynamic value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Radio(
          activeColor: UiColors.activeCyanColor,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Padding(
          padding: EdgeInsets.only(left: AppConstants.screenSize.width * 0.02),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: UiColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}

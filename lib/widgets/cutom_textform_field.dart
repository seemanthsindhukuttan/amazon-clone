import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFoemField extends StatelessWidget {
  const CustomTextFoemField({
    Key? key,
    required this.controller,
    required this.title,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: deviceWidth / 20,
            top: deviceHeight / 80,
            bottom: deviceHeight / 80,
          ),
          child: Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: deviceWidth / 25,
            right: deviceWidth / 25,
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

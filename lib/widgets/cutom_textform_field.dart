import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFoemField extends StatelessWidget {
  const CustomTextFoemField({
    Key? key,
    required this.controller,
    required this.title,
    this.obscureText = false,
    this.validator,
    this.maxLines = 1,
    this.keyboardType,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: screenSize.width / 20,
            top: screenSize.height / 80,
            bottom: screenSize.height / 80,
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
            left: screenSize.width / 25,
            right: screenSize.width / 25,
          ),
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            maxLines: maxLines,
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

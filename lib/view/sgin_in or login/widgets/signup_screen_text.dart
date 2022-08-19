import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key, required this.content}) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: screenSize.width / 20, top: screenSize.height / 70),
      child: Text(
        content,
        style: GoogleFonts.aBeeZee(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

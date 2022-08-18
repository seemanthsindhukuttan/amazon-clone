import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key, required this.content}) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: deviceWidth / 20, top: deviceHeight / 70),
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

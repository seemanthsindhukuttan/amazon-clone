import 'package:amazon_clone/view/sgin_in%20or%20login/user_auth_screen_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/gradient_button.dart';
import 'widgets/signup_screen_text.dart';

class SginInOrCreate extends StatelessWidget {
  const SginInOrCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: deviceHeight / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppConstants.amazonLogo,
                    height: deviceHeight / 15,
                  ),
                ],
              ),
              SizedBox(height: deviceHeight / 20),
              Center(
                child: Text(
                  'Sign in to your account',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SignUpText(content: 'View your wish list'),
              const SignUpText(content: 'Find & reorder past purchases'),
              const SignUpText(content: 'Track your purchases'),
              SizedBox(height: deviceHeight / 30),
              Padding(
                padding: EdgeInsets.only(left: deviceWidth / 50, right: 8.0),
                child: GradientElevatedButton(
                  bodercolor: const Color.fromARGB(255, 195, 175, 146),
                  borderRadius: BorderRadius.circular(9),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      //  Color(0xFFEEBA35),
                      Color(0xFFF4D384),
                      Color(0xFFF0BE42),
                    ],
                  ),
                  onPressed: () {
                    Get.to(UserAuthScreen());
                  },
                  child: Text(
                    'Already a customer?Sign in',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: UiColors.blackColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: deviceWidth / 50, right: 8.0, top: deviceHeight / 80),
                child: GradientElevatedButton(
                  bodercolor: Colors.grey,
                  borderRadius: BorderRadius.circular(9),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      UiColors.backgroundColor,
                      Color.fromARGB(255, 221, 221, 221)
                    ],
                  ),
                  onPressed: () {
                    Get.to(UserAuthScreen());
                  },
                  child: Text(
                    'New to Amazon.in? Create an account',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: UiColors.blackColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: deviceWidth / 50,
                  right: 8.0,
                  top: deviceHeight / 80,
                  bottom: deviceHeight / 80,
                ),
                child: GradientElevatedButton(
                  bodercolor: Colors.grey,
                  borderRadius: BorderRadius.circular(9),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      UiColors.backgroundColor,
                      Color.fromARGB(255, 221, 221, 221)
                    ],
                  ),
                  onPressed: () {
                    //todo button
                  },
                  child: Text(
                    'Skip Sign in',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: UiColors.blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

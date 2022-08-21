import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/text_signup_screen.dart';
import '../auth/user_auth_screen.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../widgets/gradient_button.dart';

class SginInOrCreate extends StatelessWidget {
  const SginInOrCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: AppConstants.screenSize.height / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppConstants.amazonLogo,
                    height: AppConstants.screenSize.height / 15,
                  ),
                ],
              ),
              SizedBox(height: AppConstants.screenSize.height / 20),
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
              SizedBox(height: AppConstants.screenSize.height / 30),
              Padding(
                padding: EdgeInsets.only(
                    left: AppConstants.screenSize.width / 50, right: 8.0),
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
                    //! Already a customer?Sign in button.
                    Get.to(const UserAuthScreen());
                    //! Already a customer?Sign in button.
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
                    left: AppConstants.screenSize.width / 50,
                    right: 8.0,
                    top: AppConstants.screenSize.height / 80),
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
                    //! New to Amazon.in? Create an account'
                    Get.to(
                      const UserAuthScreen(
                        routeToCreate: true,
                      ),
                    );
                    //! New to Amazon.in? Create an account'
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
                  left: AppConstants.screenSize.width / 50,
                  right: 8.0,
                  top: AppConstants.screenSize.height / 80,
                  bottom: AppConstants.screenSize.height / 80,
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
                    //! Skip Sign in button
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

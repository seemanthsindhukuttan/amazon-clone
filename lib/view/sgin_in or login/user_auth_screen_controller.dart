import 'package:amazon_clone/controller/auth_screen_controller.dart';
import 'package:amazon_clone/core/colors.dart';
import 'package:amazon_clone/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/new_account_form.dart';
import 'widgets/sign_in_form.dart';

class UserAuthScreen extends StatelessWidget {
  UserAuthScreen({Key? key}) : super(key: key);

  final userAuthScreenController = Get.put(UserAuthScreenController());

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: UiColors.backgroundColor,
        centerTitle: true,
        title: SvgPicture.asset(
          AppConstants.amazonLogo,
          height: deviceHeight / 40,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth / 30, vertical: deviceWidth / 40),
                  child: Text(
                    'Welcome',
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    userAuthScreenController.authRoute();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: deviceWidth / 30, right: deviceWidth / 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: userAuthScreenController.showCreateAccount.isTrue
                            ? UiColors.backgroundColor
                            : UiColors.greyLight,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        border: Border.all(width: 0.2),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: true,
                                groupValue: userAuthScreenController
                                    .showCreateAccount.value,
                                onChanged: (_) {
                                  userAuthScreenController.authRoute();
                                },
                              ),
                              Text(
                                'Create account.',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'New to Amazon?',
                                style: GoogleFonts.montserrat(
                                  height: 1.5,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),

                          // new account form
                          userAuthScreenController.showCreateAccount.isTrue
                              ? const NewAccountForm()
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    userAuthScreenController.authRoute(
                        showCreateAccount: false);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: deviceWidth / 30, right: deviceWidth / 30),
                    child: Container(
                      width: deviceWidth,
                      decoration: BoxDecoration(
                        color:
                            userAuthScreenController.showCreateAccount.isFalse
                                ? UiColors.backgroundColor
                                : UiColors.greyLight,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        border: Border.all(width: 0.2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: false,
                                groupValue: userAuthScreenController
                                    .showCreateAccount.value,
                                onChanged: (_) {
                                  userAuthScreenController.authRoute(
                                      showCreateAccount: false);
                                },
                              ),
                              Text(
                                'Sign-In.',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Already a Customer?',
                                style: GoogleFonts.montserrat(
                                  height: 1.5,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          // Sigin account form
                          userAuthScreenController.showCreateAccount.isFalse
                              ? const SiginAccountForm()
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

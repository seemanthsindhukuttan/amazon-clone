import '../../controller/user_auth_screen_controller.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/new_account_form.dart';
import 'widgets/sign_in_form.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({Key? key, this.routeToCreate = false})
      : super(key: key);
  final bool routeToCreate;

  @override
  State<UserAuthScreen> createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  final userAuthScreenController = Get.put(UserAuthScreenController());
  @override
  void initState() {
    if (widget.routeToCreate == false) {
      userAuthScreenController.showCreateAccount.value = false;
    } else {
      userAuthScreenController.showCreateAccount.value = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: UiColors.backgroundColor,
        centerTitle: true,
        title: SvgPicture.asset(
          AppConstants.amazonLogo,
          height: AppConstants.screenSize.height / 40,
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
                      horizontal: AppConstants.screenSize.width / 30,
                      vertical: AppConstants.screenSize.width / 40),
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
                        left: AppConstants.screenSize.width / 30,
                        right: AppConstants.screenSize.width / 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: userAuthScreenController.showCreateAccount.isTrue
                            ? UiColors.backgroundColor
                            : UiColors.greyLight.withOpacity(0.1),
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
                      left: AppConstants.screenSize.width / 30,
                      right: AppConstants.screenSize.width / 30,
                    ),
                    child: Container(
                      width: AppConstants.screenSize.width,
                      decoration: BoxDecoration(
                        color:
                            userAuthScreenController.showCreateAccount.isFalse
                                ? UiColors.backgroundColor
                                : UiColors.greyLight.withOpacity(0.1),
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

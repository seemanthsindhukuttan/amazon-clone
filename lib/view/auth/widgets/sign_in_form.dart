import 'package:amazon_clone/layout/lobby_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkwell/linkwell.dart';
import '../../../controller/auth_screen_controller.dart';
import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../../widgets/cutom_textform_field.dart';
import '../../../widgets/gradient_button.dart';

class SiginAccountForm extends StatefulWidget {
  const SiginAccountForm({Key? key}) : super(key: key);

  @override
  State<SiginAccountForm> createState() => _SiginAccountFormState();
}

class _SiginAccountFormState extends State<SiginAccountForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final userAuthScreenController = Get.put(UserAuthScreenController());
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.screenSize.height / 2,
      width: AppConstants.screenSize.width,
      decoration: const BoxDecoration(
        color: UiColors.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextFoemField(
              controller: emailController,
              title: 'Email',
              validator: (value) {
                Pattern pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = RegExp('$pattern');
                if (value == null || value.isEmpty) {
                  return 'Email Required Field';
                } else if (!(regex.hasMatch(value))) {
                  return 'Invalid Email';
                } else {
                  return null;
                }
              },
            ),
            Obx(
              () => CustomTextFoemField(
                controller: passwordController,
                title: 'Amazon password',
                obscureText: userAuthScreenController.showPassword.isFalse
                    ? true
                    : false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password Required Field';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppConstants.screenSize.width / 50,
              ),
              child: Row(
                children: [
                  Obx(
                    () => Checkbox(
                      onChanged: (value) {
                        userAuthScreenController.showPassword.value = value!;
                      },
                      value: userAuthScreenController.showPassword.value,
                    ),
                  ),
                  Text(
                    'Show password',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: UiColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppConstants.screenSize.width / 25,
                right: AppConstants.screenSize.width / 25,
                top: AppConstants.screenSize.height / 40,
              ),
              child: Obx(
                () => GradientElevatedButton(
                  bodercolor: const Color.fromARGB(255, 195, 175, 146),
                  borderRadius: BorderRadius.circular(5),
                  onPressed: () async {
                    //! sign in button onpressed
                    if (_formKey.currentState!.validate()) {
                      //sign in method called
                      final response = await userAuthScreenController.sigInUser(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      // check respose
                      if (response == true) {
                        emailController.clear();
                        passwordController.clear();
                        //route to home
                        Get.offAll(const LayoutScreen());
                      }
                    }
                    //! sign in button onpressed
                  },
                  child: userAuthScreenController.buttonLoading.isFalse
                      ? Text(
                          'Sign In',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: UiColors.blackColor,
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: CircularProgressIndicator(
                              color: UiColors.backgroundColor,
                            ),
                          ),
                        ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppConstants.screenSize.width / 25,
                right: AppConstants.screenSize.width / 25,
                top: AppConstants.screenSize.height / 40,
              ),
              child: LinkWell(
                "By creating an account,you agree to Amazon's https://seemanthsindhukuttan.github.io/#home and https://seemanthsindhukuttan.github.io/#about",
                listOfNames: const {
                  'https://seemanthsindhukuttan.github.io/#home':
                      'Conditions of Use',
                  'https://seemanthsindhukuttan.github.io/#about':
                      'Privacy Notice'
                },
                style: GoogleFonts.aBeeZee(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: UiColors.blackColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppConstants.screenSize.width / 25,
                right: AppConstants.screenSize.width / 25,
                top: AppConstants.screenSize.height / 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_right_rounded),
                  LinkWell(
                    " https://seemanthsindhukuttan.github.io/#home ",
                    listOfNames: const {
                      'https://seemanthsindhukuttan.github.io/#home':
                          'Need help?',
                    },
                    style: GoogleFonts.aBeeZee(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: UiColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

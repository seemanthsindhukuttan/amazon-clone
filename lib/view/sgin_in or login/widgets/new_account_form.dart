import 'package:amazon_clone/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkwell/linkwell.dart';

import '../../../widgets/cutom_textform_field.dart';
import '../../../widgets/gradient_button.dart';

class NewAccountForm extends StatefulWidget {
  const NewAccountForm({Key? key}) : super(key: key);

  @override
  State<NewAccountForm> createState() => _NewAccountFormState();
}

class _NewAccountFormState extends State<NewAccountForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      color: UiColors.backgroundColor,
      height: deviceHeight / 1.8,
      width: deviceWidth,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFoemField(
              controller: nameController,
              title: 'First and last name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required Field';
                } else {
                  return null;
                }
              },
            ),
            CustomTextFoemField(
              controller: emailController,
              title: 'Email',
              validator: (value) {
                Pattern pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = RegExp('$pattern');
                if (value == null || value.isEmpty) {
                  return 'Required Field';
                } else if (!(regex.hasMatch(value))) {
                  return 'Invalid Email';
                } else {
                  return null;
                }
              },
            ),
            CustomTextFoemField(
              controller: passwordController,
              title: 'Create a password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required Field';
                } else if (value.length < 6) {
                  return 'Min 6 characters';
                } else {
                  return null;
                }
              },
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: deviceWidth / 50,
              ),
              child: Row(
                children: [
                  Checkbox(onChanged: (v) {}, value: true),
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
                left: deviceWidth / 55,
                right: deviceWidth / 25,
                top: deviceHeight / 90,
              ),
              child: GradientElevatedButton(
                bodercolor: const Color.fromARGB(255, 195, 175, 146),
                borderRadius: BorderRadius.circular(5),
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
                  if (_formKey.currentState!.validate()) {
                    nameController.clear();
                    emailController.clear();
                    passwordController.clear();
                  }
                },
                child: Text(
                  'Continue',
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
                left: deviceWidth / 25,
                right: deviceWidth / 25,
                top: deviceHeight / 50,
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
          ],
        ),
      ),
    );
  }
}

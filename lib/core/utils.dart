import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'colors.dart';

class AppUtils {
  // snackbar ==>
  static void snackBar({
    String title = '',
    String content = '',
  }) {
    Get.snackbar(
      duration: const Duration(seconds: 5),
      title,
      content,
      backgroundColor: UiColors.backgroundColor,
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      backgroundGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: UiColors.primaryButtonGradient,
      ),
    );
  } // <==

  //image picker function ==>
  static Future<Uint8List?> pickImage({required ImageSource source}) async {
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: source);
    if (xFile != null) {
      return xFile.readAsBytes();
    } else {
      return null;
    }
  } // <==

  // sha1 hashing uid genarator ==>
  static String uid() {
    final randomNumber = Random().nextDouble();
    final randomBytes = utf8.encode(randomNumber.toString());
    final randomString = sha1.convert(randomBytes).toString();
    return randomString;
  } // <==

  static CircularProgressIndicator appCircularProgressIndicator =
      const CircularProgressIndicator(
    color: UiColors.activeCyanColor,
  );
}

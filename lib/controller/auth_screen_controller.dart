import 'dart:developer';
import 'package:amazon_clone/core/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../view/auth/user_auth_screen.dart';

class UserAuthScreenController extends GetxController {
  // create account form or signup form
  final RxBool _showCreateAccount = true.obs;

  // showpassword or hide
  final RxBool _showPassword = false.obs;

  // loading signin
  final RxBool _buttonLoading = false.obs;

  //getter create account form or signup form
  RxBool get showCreateAccount => _showCreateAccount;

  //getter showpassword or hide
  RxBool get showPassword => _showPassword;

  //getter loading signin
  RxBool get buttonLoading => _buttonLoading;

  // firebase auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // firebase cloud firestore instance
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  // page route and show or hide create account form or signup form ==>
  void authRoute({
    bool showCreateAccount = true,
  }) {
    if (showCreateAccount == true) {
      _showCreateAccount.value = true;
      showPassword.value = false;
      Get.to(const UserAuthScreen());
    } else {
      _showCreateAccount.value = false;
      showPassword.value = false;
      Get.to(const UserAuthScreen());
    }
  } //<==

  // sigup User ==>
  Future<bool> sigUpUser(
      {required String username,
      required String email,
      required String password,
      required String address}) async {
    try {
      buttonLoading.value = true;
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUtils.snackBar(
        title: 'Authentication Message',
        content: 'Your Amazon account has been created.',
      );
      //upload to firestore
      await _uploadUserData(
        username: username,
        address: address,
        email: '${userCredential.user?.email}',
      );

      return true;
    } on FirebaseAuthException catch (e) {
      AppUtils.snackBar(
        title: 'Authentication Message',
        content: e.message.toString(),
      );

      log(e.message.toString());
      log(e.toString());
      return false;
    }
  } //<==

  // signIN User ==>
  Future<bool> sigInUser({
    required String email,
    required String password,
  }) async {
    try {
      buttonLoading.value = true;

      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUtils.snackBar(
        title: 'Authentication Message',
        content: 'Your Amazon account has been logged in .',
      );

      return true;
    } on FirebaseAuthException catch (e) {
      buttonLoading.value = false;
      AppUtils.snackBar(
        title: 'Authentication Message',
        content: e.message.toString(),
      );
      log(e.message.toString());
      return false;
    }
  } //<==

  // upload User data to firestore ==>
  Future<void> _uploadUserData(
      {required String username,
      required String address,
      required String email}) async {
    await _collectionReference
        .doc(_firebaseAuth.currentUser?.uid)
        .set({
          "name": username,
          "address": address,
          "email": email,
        })
        .then((value) => log("User Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }
  //<==

}

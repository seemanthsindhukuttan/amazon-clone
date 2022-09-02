import 'dart:developer';
import 'package:amazon_clone/controller/user_auth_screen_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../core/utils.dart';

class AuthService {
  // firebase cloud firestore instance
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  // firebase auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // sigup User Function ==>
  Future<bool> sigUpUser({
    required String username,
    required String email,
    required String password,
    required String address,
  }) async {
    try {
      Get.find<UserAuthScreenController>().buttonLoading.value = true;
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //upload user detials to firestore
      await _collectionReference
          .doc(_firebaseAuth.currentUser?.uid)
          .set({
            "name": username,
            "address": address,
          })
          .then((value) => log("User Added"))
          .catchError((error) => log("Failed to add user: $error"));

      // snackBar
      AppUtils.snackBar(
        title: 'Authentication Message',
        content: 'Your Amazon account has been created.',
      );

      return true;
    } on FirebaseAuthException catch (e) {
      // snackBar
      AppUtils.snackBar(
        title: 'Authentication Message',
        content: e.message.toString(),
      );

      log(e.message.toString());
      log(e.toString());
      return false;
    }
  } //<==

  // sign in User Function ==>
  Future<bool> sigInUser({
    required String email,
    required String password,
  }) async {
    try {
      Get.find<UserAuthScreenController>().buttonLoading.value = true;

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
      Get.find<UserAuthScreenController>().buttonLoading.value = false;
      AppUtils.snackBar(
        title: 'Authentication Message',
        content: e.message.toString(),
      );
      log(e.message.toString());
      return false;
    }
  } //<==

}

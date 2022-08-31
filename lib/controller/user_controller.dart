import 'package:amazon_clone/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> userDetials =
      UserModel(username: 'Loding......', address: '').obs;

  @override
  void onInit() {
    _getUserData();
    super.onInit();
  }

  //get user detials from firebasefireStore function.
  Future<void> _getUserData() async {
    //get user detials from firebasefireStore.
    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    //json converted to model.
    userDetials.value = UserModel.getModelFromJson(userData.data() as dynamic);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_model.dart';

class UserDetialService {
  //get user detials from firebasefireStore.
  Future<UserModel> getUserData() async {
    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    //json data  converted to model object.
    UserModel userDetials = UserModel.fromJson(userData.data() as dynamic);

    return userDetials;
  }
}

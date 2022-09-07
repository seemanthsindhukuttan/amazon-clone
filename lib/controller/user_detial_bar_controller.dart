import '../model/user_model.dart';
import '../services/user_detial_service.dart';
import 'package:get/get.dart';

class UserDetialController extends GetxController {
  //user model
  Rx<UserModel> userDetials =
      UserModel(username: 'Loding......', address: '').obs;

  @override
  Future<void> onInit() async {
    //call userdetialService function from services
    userDetials.value = await UserDetialService().getUserData();
    super.onInit();
  }
}

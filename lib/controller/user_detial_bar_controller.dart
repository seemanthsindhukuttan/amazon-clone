import 'package:get/get.dart';

import '../model/user_model.dart';
import '../services/service.dart';

class UserDetialController extends GetxController {
  //user model
  Rx<UserModel> userDetials =
      UserModel(username: 'Loding......', address: '').obs;

  @override
  Future<void> onInit() async {
    //call userdetialService function from services
    userDetials.value = await AppService().getUserData();
    super.onInit();
  }
}

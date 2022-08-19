import 'package:get/get.dart';
import '../view/sgin_in or login/user_auth_screen_controller.dart';

class UserAuthScreenController extends GetxController {
  final RxBool _showCreateAccount = true.obs;
  final RxBool showPassword = false.obs;
  RxBool get showCreateAccount => _showCreateAccount;

  void authRoute({bool showCreateAccount = true}) {
    if (showCreateAccount == true) {
      _showCreateAccount.value = true;
      showPassword.value = false;
      Get.to(UserAuthScreen());
    } else {
      _showCreateAccount.value = false;
      showPassword.value = false;
      Get.to(UserAuthScreen());
    }
  }
}

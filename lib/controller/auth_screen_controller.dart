import 'package:get/get.dart';
import '../view/auth/user_auth_screen.dart';

class UserAuthScreenController extends GetxController {
  final RxBool _showCreateAccount = true.obs;
  final RxBool showPassword = false.obs;
  RxBool get showCreateAccount => _showCreateAccount;

  void authRoute({
    bool showCreateAccount = true,
  }) {
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

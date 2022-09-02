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

}

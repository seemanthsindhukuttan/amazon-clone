import 'package:amazon_clone/core/colors.dart';
import 'package:get/get.dart';

class AppUtils {
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
    );
  }
}

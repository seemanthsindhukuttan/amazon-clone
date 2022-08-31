import 'dart:typed_data';
import 'package:amazon_clone/core/colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AppUtils {
  // snackbar
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

  //image picker function.
  static Future<Uint8List?> pickImage({required ImageSource source}) async {
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: source);
    if (xFile != null) {
      return xFile.readAsBytes();
    } else {
      return null;
    }
  }
}

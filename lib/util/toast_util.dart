import 'package:get/get.dart';
import 'package:todo_api_test/constant/appcolors.dart';

class ToastUtil {
  static void success(String message) {
    Get.snackbar('Success', message, backgroundColor: Appcolors.Colorgreen);
  }

  static void error(String message) {
    Get.snackbar('Eroor', message, backgroundColor: Appcolors.Colorlitered);
  }
}

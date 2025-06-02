import 'package:get/get.dart';

class IsvisibleController extends GetxController {
  RxBool isvisible = false.obs;

  void updateValue() {
    isvisible.value = !isvisible.value;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  RxBool isdark = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    isdark.value = box.read('isdark') ?? false;
    Get.changeThemeMode(isdark.value ? ThemeMode.dark : ThemeMode.light);
    super.onInit();
  }

  void switchtheme() {
    isdark.value = !isdark.value;
    Get.changeThemeMode(isdark.value ? ThemeMode.dark : ThemeMode.light);
    box.write('isdark', isdark.value);
  }
}

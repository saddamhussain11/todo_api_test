import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:todo_api_test/constant/api_endpoints.dart';
import 'package:todo_api_test/module/user_model.dart';
import 'package:todo_api_test/util/toast_util.dart';
import 'package:todo_api_test/view/auth/login_screen.dart';
import 'package:todo_api_test/view/user/home_screen.dart';

class Authcontroller extends GetxController {
  RxBool isLoading = false.obs;
  final box = GetStorage();
  Future signup(String name, String email, String pasword) async {
    try {
      print('Signup Buton pres');
      isLoading.value = true;
      UserModel usermodel = UserModel(
        createdAt: DateTime.now().toString(),
        name: name,
        email: email,
        password: pasword,
        avatar: '',
        id: generateRandomId().toString(),
        token: DateTime.now().toString(),
      );

      print('data passed to model');
      final response = await http.post(
        Uri.parse('https://683a918a43bb370a86730bc1.mockapi.io/todoapi/auth'),

        body: usermodel.toJson(),
      );
      print('api hit');
      print(response.statusCode);
      if (response.statusCode == 201) {
        final data = json.decode(response.body);

        /// Token store in GetStorage
        box.write('token', data['token']);

        print('Token saved: ${data['token']}');
        print(response.body);
        ToastUtil.success('Account created');

        Get.to(() => HomeScreen());
      }
    } catch (e) {
      ToastUtil.error('fail');
    } finally {
      isLoading.value = false;
    }
  }

  Future login(String email, String password) async {
    try {
      print('Login Button pressed');
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('https://683a918a43bb370a86730bc1.mockapi.io/todoapi/auth'),
        body: {
          'createdAt': DateTime.now().toString(),
          'email': email,
          'password': password,
        },
      );

      print(response.statusCode);

      if (response.statusCode == 201) {
        ToastUtil.success('Login Successful');
        Get.to(() => HomeScreen()); // change screen accordingly
      } else {
        ToastUtil.error('Invalid Credentials');
      }
    } catch (e) {
      ToastUtil.error('Login failed');
    } finally {
      isLoading.value = false;
    }
  }

  RxList<dynamic> currentUser = <dynamic>[].obs;

  Future<void> getCurrentUserData() async {
    final token = box.read('token');

    try {
      final response = await http.get(
        Uri.parse('https://683a918a43bb370a86730bc1.mockapi.io/todoapi/auth'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final UserModel allUsers = json.decode(response.body);
        currentUser.assignAll([allUsers]);
        // 🔍 Filter current user using saved email
      }
    } catch (e) {
      ToastUtil.error('Error fetching user');
    }
  }

  Future<void> editCurrentUserData(String id, String name) async {
    try {
      final response = await http.put(
        Uri.parse(
          'https://683a918a43bb370a86730bc1.mockapi.io/todoapi/auth/$id',
        ), // ✅ Corrected URL
        headers: {'Content-Type': 'application/json'},
        body: {'name': name},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final updatedUser = json.decode(response.body);

        // ✅ Update RxList currentUser
        currentUser.value = [updatedUser];

        ToastUtil.success('User updated successfully');
      } else {
        ToastUtil.error('Failed to update user');
      }
    } catch (e) {
      ToastUtil.error('Error updating user');
    }
  }

  String generateRandomId({int length = 5}) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return List.generate(
      length,
      (index) => chars[random.nextInt(chars.length)],
    ).join();
  }

  void generateId() {
    String randomId = generateRandomId(); // Default length is 10
    print('Random ID: $randomId');

    String customLengthId = generateRandomId(length: 16); // Custom length
    print('Custom Length ID: $customLengthId');
  }
}

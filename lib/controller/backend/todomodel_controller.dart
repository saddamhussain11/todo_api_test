import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo_api_test/module/todolist_model.dart';
import 'package:todo_api_test/util/toast_util.dart';
import 'package:todo_api_test/view/user/home_screen.dart';

class TodomodelController extends GetxController {
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

  RxBool isloading = false.obs;

  Future addtodo(String title, String description) async {
    try {
      print('Add Todo Button Pressed');
      isloading.value = true;
      TodolistModel todolistModel = TodolistModel(
        createdAt: DateTime.now().toString(),
        title: title,
        description: description,
        token: DateTime.now().toString(),
        id: generateRandomId().toString(),
      );
      final response = await http.post(
        Uri.parse(
          'https://683a918a43bb370a86730bc1.mockapi.io/todoapi/alltodos',
        ),
        body: todolistModel.toJson(),
      );

      print('Status code: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Response body: ${response.body}');
        ToastUtil.success('Todo Added');
        Get.to(() => HomeScreen());
      } else {
        print('Unexpected status: ${response.statusCode}');
        ToastUtil.error('Failed to add todo');
      }
    } catch (e) {
      print('Error in addtodo: $e'); // 🟢 This helps in debugging
      ToastUtil.error('Error occurred');
    } finally {
      isloading.value = false;
    }
  }

  RxList<TodolistModel> todolist = <TodolistModel>[].obs;
  Future gettodo() async {
    try {
      isloading.value = true;

      final response = await http.get(
        Uri.parse(
          'https://683a918a43bb370a86730bc1.mockapi.io/todoapi/alltodos',
        ),
      );

      print('Status code: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        todolist.assignAll(
          (data as List).map((e) => TodolistModel.fromJson(e)).toList(),
        );
        print('Response body: ${response.body}');
      } else {
        print('Unexpected status: ${response.statusCode}');
        ToastUtil.error('Failed to todo');
      }
    } catch (e) {
      print('Error in addtodo: $e'); // 🟢 This helps in debugging
      ToastUtil.error('Error occurred');
    } finally {
      isloading.value = false;
    }
  }

  Future delettodo(String id) async {
    try {
      isloading.value = true;

      final response = await http.delete(
        Uri.parse(
          'https://683a918a43bb370a86730bc1.mockapi.io/todoapi/alltodos/$id',
        ),
      );

      print('Status code: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        todolist.assignAll(
          (data as List).map((e) => TodolistModel.fromJson(e)).toList(),
        );
        ToastUtil.success('todo delet');
        print('Response body: ${response.body}');
      } else {
        print('Unexpected status: ${response.statusCode}');
        ToastUtil.error('Failed to todo');
      }
    } catch (e) {
      print('Error in addtodo: $e'); // 🟢 This helps in debugging
      ToastUtil.error('Error occurred');
    } finally {
      isloading.value = false;
    }
  }

  Future edittodo(String id, String title, String des) async {
    try {
      isloading.value = true;

      final response = await http.put(
        Uri.parse(
          'https://683a918a43bb370a86730bc1.mockapi.io/todoapi/alltodos/$id',
        ),
        body: {'title': title, 'description': des},
      );

      print('Status code: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        ToastUtil.success('todo edit');
        print('Response body: ${response.body}');
      } else {
        print('Unexpected status: ${response.statusCode}');
        ToastUtil.error('Failed to todo');
      }
    } catch (e) {
      print('Error in addtodo: $e'); // 🟢 This helps in debugging
      ToastUtil.error('Error occurred');
    } finally {
      isloading.value = false;
    }
  }
}

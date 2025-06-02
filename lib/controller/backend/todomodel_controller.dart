import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo_api_test/util/toast_util.dart';
import 'package:todo_api_test/view/user/home_screen.dart';

class TodomodelController extends GetxController {
  RxBool isloading = false.obs;

  Future addtodo(String title, String description) async {
    try {
      print('Add Todo Button Pressed');
      isloading.value = true;

      final response = await http.post(
        Uri.parse(
          'https://683a918a43bb370a86730bc1.mockapi.io/todoapi/alltodos',
        ),
        body: {
          'title': title,
          'description': description,
          'createdAt': DateTime.now().toIso8601String(),
          'token': '26edde3dd1a9f73bfea1a6cc',
        },
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
}

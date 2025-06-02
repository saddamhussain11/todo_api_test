import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo_api_test/constant/api_endpoints.dart';
import 'package:todo_api_test/module/user_model.dart';
import 'package:todo_api_test/util/toast_util.dart';
import 'package:todo_api_test/view/auth/login_screen.dart';

class Authcontroller extends GetxController {
  RxBool isLoading = false.obs;

  Future signup(String name, String email, String pasword) async {
    try {
      print('Signup Buton pres');
      isLoading.value = true;
      UserModel usermodel = UserModel(
        createdAt: DateTime.now().toString(),
        name: name,
        email: email,
        password: pasword,
        token: 'ba1a3a0f153bda9f2a3ce7b7',
      );
      final response = await http.post(
        Uri.parse('https://683a918a43bb370a86730bc1.mockapi.io/todoapi/auth'),

        body: {
          'createdAt': DateTime.now().toString(),
          'name': name,
          'email': email,
          'password': pasword,
          'token': 'ba1a3a0f153bda9f2a3ce7b7',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.body);
        ToastUtil.success('Account created');

        Get.to(() => LoginScreen());
      }
    } catch (e) {
      ToastUtil.error('fail');
    } finally {
      isLoading.value = false;
    }
  }
}

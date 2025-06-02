import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_api_test/constant/appcolors.dart';
import 'package:todo_api_test/constant/appimages.dart';
import 'package:todo_api_test/controller/backend/authcontroller.dart';
import 'package:todo_api_test/widget/Button/Custom_Buton.dart';
import 'package:todo_api_test/widget/Fields/custom_textfield.dart';

class ForgatpaswordScreen extends StatefulWidget {
  const ForgatpaswordScreen({super.key});

  @override
  State<ForgatpaswordScreen> createState() => _ForgatpaswordScreenState();
}

class _ForgatpaswordScreenState extends State<ForgatpaswordScreen> {
  TextEditingController emailcontroler = TextEditingController();
  Authcontroller authcontroller = Get.put(Authcontroller());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: authcontroller.isLoading.value,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 172.h),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Forgat Pasword',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 31.h),
                      Image.asset(Appimages.addto),
                      SizedBox(height: 25.h),
                      CustomTextfield(
                        controller: emailcontroler,
                        width: 320.w,
                        color: Appcolors.Colorweight,
                        labeltext: 'Forgat Pasword',
                        inputType: TextInputType.text,
                        obscuretext: false,
                        validator: (Value) {
                          if (Value == '' || Value == null) {
                            return 'please Enter Your Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 45.h),
                      Custombuton(
                        width: 220.w,
                        height: 44.h,
                        backgroundColor: Appcolors.Colorgreen,
                        ontap: () {},
                        // authcontroller.forgotPassword(formkey, emailcontroler),
                        isLoading: authcontroller.isLoading.value,
                        title: 'Forgat ',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

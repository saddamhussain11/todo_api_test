import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_api_test/constant/appcolors.dart';
import 'package:todo_api_test/constant/appimages.dart';
import 'package:todo_api_test/view/auth/signup_screen.dart';
import 'package:todo_api_test/widget/Button/Custom_Buton.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: Image.asset(Appimages.Onboarding),
            ),
            SizedBox(height: 43.h),
            Text(
              'Get things done with TODo',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.only(left: 74.w, right: 59.w),
              child: Text(
                textAlign: TextAlign.center,
                'Lorem ipsum dolor sit amet, consectetur adipisicing. Maxime,tempore! Animi nemo aut atque,deleniti nihil dolorem repellendus.',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 56.h),
            Custombuton(
              width: 220.w,
              height: 44.h,
              backgroundColor: Appcolors.Colorgreen,
              ontap: () {
                final box = GetStorage();
                box.write('onbording', true);
                Get.to(SignupScreen());
              },
              title: 'Get Started ',
            ),
            SizedBox(height: 79.h),
          ],
        ),
      ),
    );
  }
}

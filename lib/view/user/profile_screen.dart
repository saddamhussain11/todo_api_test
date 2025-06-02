import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_api_test/constant/appcolors.dart';
import 'package:todo_api_test/controller/backend/authcontroller.dart';
import 'package:todo_api_test/controller/backend/userinfo_controller.dart';
import 'package:todo_api_test/widget/Fields/custom_textfield.dart';
import 'package:todo_api_test/widget/card/Custom_Container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Authcontroller authcontroller = Get.put(Authcontroller());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  UserinfoController userinfoController = Get.put(UserinfoController());
  final argument = Get.arguments;
  @override
  void initState() {
    authcontroller.getCurrentUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = argument['name'] ?? '';
    emailController.text = argument['email'] ?? '';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
              height: 295.h,
              width: double.infinity.w,
              backgroundColor: Appcolors.Colorgreen,
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Appcolors.Colorgrey,
                        maxRadius: 60.r,
                        backgroundImage: NetworkImage(argument['avatar'] ?? ''),
                      ),
                      CircleAvatar(
                        maxRadius: 60.r,
                        backgroundColor: Colors.grey.shade100.withValues(
                          alpha: 0.6,
                        ),
                        child: Icon(Icons.image, size: 50.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 28.h),
                  Flexible(
                    child: CustomContainer(
                      height: 55.h,
                      width: double.infinity.w,
                      backgroundColor: Appcolors.Colorgreen2,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  Text(
                    'Edit profile',
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w500,
                      color: Appcolors.Colorgreen,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  CustomTextfield(
                    controller: nameController,
                    color: Appcolors.Colorweight,
                    border: true,
                    borderColor: Appcolors.Colorweight,
                    labeltext: '',
                    inputType: TextInputType.text,
                    obscuretext: false,
                    sufixicon: Icon(Icons.edit),
                  ),
                  SizedBox(height: 15.h),
                  CustomTextfield(
                    controller: emailController,
                    color: Appcolors.Colorweight,
                    border: true,
                    borderColor: Appcolors.Colorweight,
                    labeltext: '',
                    inputType: TextInputType.text,
                    obscuretext: false,
                    readonly: true,
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'More',
                        style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.Colorgreen,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          authcontroller.editCurrentUserData(
                            argument['id'] ?? '',
                            nameController.text,
                          );
                          authcontroller.getCurrentUserData();
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.Colorgreen,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 45.h),
                  Row(
                    children: [
                      Icon(Icons.privacy_tip),
                      SizedBox(width: 10.w),
                      Text(
                        'Privacy policy',
                        style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.Colorblack,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Icon(Icons.twenty_four_mp_sharp),
                      SizedBox(width: 10.w),
                      Text(
                        'terms and Conditions',
                        style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.Colorblack,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  InkWell(
                    onTap: () {},
                    // authcontroller.logout(),
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Appcolors.Colorlitered),
                        SizedBox(width: 10.w),
                        Text(
                          'logout',
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.Colorlitered,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

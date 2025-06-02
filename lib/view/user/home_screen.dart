import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_api_test/constant/appcolors.dart';
import 'package:todo_api_test/controller/Ui/theme_controller.dart';
import 'package:todo_api_test/controller/backend/authcontroller.dart';
import 'package:todo_api_test/controller/backend/todomodel_controller.dart';
import 'package:todo_api_test/controller/backend/userinfo_controller.dart';
import 'package:todo_api_test/module/todolist_model.dart';
import 'package:todo_api_test/module/user_model.dart';
import 'package:todo_api_test/util/date&time_util.dart';
import 'package:todo_api_test/util/loading_util.dart';
import 'package:todo_api_test/view/user/addtodolist_screen.dart';
import 'package:todo_api_test/view/user/detail_screen.dart';
import 'package:todo_api_test/view/user/profile_screen.dart';
import 'package:todo_api_test/widget/card/Custom_Container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodomodelController todomodelController = Get.put(TodomodelController());
  Authcontroller authcontroller = Get.put(Authcontroller());
  ThemeController themeController = Get.put(ThemeController());
  final Random random = Random();

  Color getRandomColor() {
    return Color.fromRGBO(
      random.nextInt(256), // Red (0-255)
      random.nextInt(256), // Green (0-255)
      random.nextInt(256), // Blue (0-255)
      1.0, // Opacity (Full opacity)
    );
  }

  @override
  void initState() {
    // todomodelController.gettodo();
    authcontroller.getCurrentUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              themeController.switchtheme();
            },
            icon: Icon(Icons.brightness_2_outlined),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 280.h,
            width: double.infinity,
            decoration: BoxDecoration(color: Appcolors.Colorgreen),
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Obx(() {
                  if (authcontroller.isLoading.value == true) {
                    return LoadingUtil.shimmerTile(itemcount: 1);
                  } else if (authcontroller.currentUser.isEmpty) {
                    return Center(
                      child: IconButton(
                        onPressed: () {
                          authcontroller.getCurrentUserData();
                        },
                        icon: Icon(Icons.panorama),
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // UserModel userModel = UserModel(
                            //     userid: userId,
                            //     name: userinfoController
                            //         .userinfolist.first.name,
                            //     email: userinfoController
                            //         .userinfolist.first.email,
                            //     image: userinfoController
                            //         .userinfolist.first.image);
                            Get.to(
                              ProfileScreen(),
                              arguments: {
                                'name':
                                    authcontroller.currentUser.first['name'],
                                'email':
                                    authcontroller.currentUser.first['email'],
                                'avatar':
                                    authcontroller.currentUser.first['avatar'],
                                'id': authcontroller.currentUser.first['id'],
                              },
                            );
                            // Get.to(ProfileScreen());
                          },
                          child: CircleAvatar(
                            backgroundColor: Appcolors.Colorweight,
                            maxRadius: 60.r,
                            backgroundImage: NetworkImage(
                              authcontroller.currentUser.first['avatar'],
                            ),
                          ),
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          authcontroller.currentUser.first['name'],
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.Colorblack,
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Todo list ',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Appcolors.Colorblack,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Obx(() {
            if (todomodelController.isloading.value == true) {
              return LoadingUtil.shimmerTile(itemcount: 8);
            }
            //  else if (todomodelController.todolist.isEmpty) {
            //   return Center(child: Text('No Products Found'));
            // }
            else {
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.sp), // Responsive padding
                      child: CustomContainer(
                        height: 70.h,
                        width: 354.w,
                        backgroundColor: getRandomColor().withValues(alpha: .3),
                        borderRadius: BorderRadius.circular(10),
                        child: ListTile(
                          style: theme.listTileTheme.style,
                          onTap: () {
                            // TodolistModel todolistModel = TodolistModel(
                            //   docid: todomodelController.todolist[index].docid,
                            //   userid: userId,
                            //   title: todomodelController.todolist[index].title,
                            //   description:
                            //       todomodelController
                            //           .todolist[index]
                            //           .description,
                            //   Time: DateTimeUtil.formatTime(
                            //     todomodelController.todolist[index].Time,
                            //   ),
                            // );
                            Get.to(DetailScreen());
                          },
                          leading: GestureDetector(
                            onTap: () async {
                              // final String docid =
                              //     todomodelController.todolist[index].docid;
                              // todomodelController.delettodo(docid);
                              // todomodelController.gettodo();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(Icons.delete),
                            ),
                          ),
                          title: Text(
                            'todomodelController.todolist[index].title',
                          ),
                          subtitle: Text(
                            'todomodelController.todolist[index].description',
                          ),
                          trailing: Text(
                            'text',
                            // DateTimeUtil.formatTime(
                            //   todomodelController.todolist[index].Time,
                            // ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddtodolistScreen());
        },
        backgroundColor: Appcolors.Colorgreen,
        child: Icon(Icons.add, color: Colors.white),
        shape: CircleBorder(),
      ),
    );
  }
}

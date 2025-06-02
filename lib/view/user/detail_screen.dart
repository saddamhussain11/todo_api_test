import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_api_test/module/todolist_model.dart';
import 'package:todo_api_test/view/user/edit_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final TodolistModel arguments = Get.arguments;
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_circle_left_outlined, size: 35.sp),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit_note, size: 40.sp),
                ),
              ],
            ),
            SizedBox(height: 70.h),
            // Text(arguments.title, style: theme.textTheme.bodyLarge),
            SizedBox(height: 10.h),
            Divider(thickness: 3.h),
            SizedBox(height: 40.h),
            Text(
              '',
              // arguments.description,
              // style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20.h),
            Text(
              '',
              //  textAlign: TextAlign.right,
              // arguments.Time,
              //  style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // void passArgument() {
  //   final String userid = FirebaseAuth.instance.currentUser!.uid;
  //   final TodolistModel arguments = Get.arguments;
  //   TodolistModel todolistModel = TodolistModel(
  //     docid: arguments.docid,
  //     userid: userid,
  //     title: arguments.title,
  //     description: arguments.description,
  //     Time: arguments.Time,
  //   );
  //   Get.to(EditScreen(), arguments: todolistModel);
  // }
}

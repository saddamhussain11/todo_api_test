import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_api_test/constant/appcolors.dart';

class LoadingUtil {
  // ✅ Button Loading Widget
  static Widget buttonLoading({
    double size = 20,
    Color color = Appcolors.Colorweight,
  }) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Appcolors.Colorweight,
      ),
    );
  }

  // ✅ Show Loading Dialog
  static void showLoadingDialog({String message = "Please wait..."}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Appcolors.Colorweight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(color: Appcolors.Colorblu),
            SizedBox(height: 16.h),
            Text(message, style: TextStyle(fontSize: 16.sp)),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  // ✅ Hide Dialog
  static void hideLoadingDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static Widget shimmerTile({
    double height = 80,
    double width = double.infinity,
    int? itemcount,
  }) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemcount, // Number of shimmer placeholders
        itemBuilder:
            (_, __) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: height,
                width: width,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
      ),
    );
  }

  static Widget shimmerCircle({
    double height = 80,
    double width = double.infinity,
    int? itemcount,
  }) {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.yellow,
        child: CircleAvatar(radius: 70),
      ),
    );
    //  ListView.builder(
    //   itemCount: itemcount, // Number of shimmer placeholders
    //   itemBuilder: (_, __) => Shimmer.fromColors(
    //     baseColor: Colors.grey[300]!,
    //     highlightColor: Colors.grey[100]!,
    //     child: Container(
    //       height: height,
    //       width: width,
    //       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //   ),
    // ),
  }
}

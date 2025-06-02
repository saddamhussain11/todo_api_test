import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_api_test/constant/appcolors.dart';

class Custombuton extends StatelessWidget {
  final String? title; // Optional child widget
  final List<Color>? colors; // Optional gradient colors
  final Color? backgroundColor; // Optional solid background color
  final Alignment begin;
  final Alignment end;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final BoxShape shape; // Added shape parameter
  final BoxBorder? border; // Optional border parameter
  final VoidCallback ontap;
  final bool? isLoading;

  const Custombuton({
    super.key,
    this.title,
    this.colors, // Optional gradient
    this.backgroundColor, // Optional solid background color
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.height,
    this.width,
    this.borderRadius,
    this.shape = BoxShape.rectangle, // Default to rectangle
    this.border,
    required this.ontap, // Initialize optional border
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color:
              colors == null
                  ? backgroundColor
                  : null, // Use solid color if gradient is not provided
          gradient:
              colors != null
                  ? LinearGradient(colors: colors!, begin: begin, end: end)
                  : null, // Use gradient only if colors are provided
          shape: shape,
          borderRadius: shape == BoxShape.circle ? null : borderRadius,
          border: border, // Apply optional border
        ),
        child: Center(
          child:
              isLoading == true
                  ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      color: Appcolors.Colorweight,
                    ),
                  )
                  : Text(
                    title.toString(),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Appcolors.Colorweight,
                    ),
                  ),
        ),
      ),
    );
  }
}

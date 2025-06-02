import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_api_test/constant/appcolors.dart';
import 'package:todo_api_test/controller/Ui/isvisible_controller.dart';

class CustomTextfield extends StatefulWidget {
  final String labeltext;
  final TextInputType inputType;
  final bool obscuretext;
  final Color color;
  final IconData? iconData;
  final bool showSuffixIcon;
  final Color? borderColor;
  final double? width; // Optional width
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? sufixicon;
  final bool? border;
  final bool? readonly;
  final BorderRadius? borderRadius;

  const CustomTextfield({
    super.key,
    required this.color,
    required this.labeltext,
    required this.inputType,
    required this.obscuretext,
    this.iconData,
    this.showSuffixIcon = false,
    this.borderColor,
    this.width, // Optional parameter
    this.controller,
    this.validator,
    this.sufixicon,
    this.border,
    this.readonly,
    this.borderRadius,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  final IsvisibleController isvisibleController = Get.put(
    IsvisibleController(),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isvisibleController.isvisible.value,
      controller: widget.controller,
      keyboardType: widget.inputType,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      readOnly: widget.readonly ?? false,
      style: TextStyle(color: Appcolors.Colorblack, fontSize: 16.sp),
      validator: widget.validator,
      decoration: InputDecoration(
        fillColor: widget.color,
        filled: true,
        prefixIcon:
            widget.iconData != null
                ? Icon(
                  widget.iconData,
                  color: Appcolors.Colorblack,
                  size: 24.sp,
                )
                : null,
        suffixIcon:
            widget.showSuffixIcon
                ? IconButton(
                  onPressed: () {
                    isvisibleController.updateValue();
                  },
                  icon: Icon(
                    isvisibleController.isvisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                )
                : widget.sufixicon,
        hintText: widget.labeltext,
        hintStyle: TextStyle(color: Appcolors.Colorblack, fontSize: 16.sp),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Appcolors.Colorgrey.shade200,
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Appcolors.Colorgrey.shade400,
            width: 0.5.w,
          ), // When focused
        ),
      ),
    );
  }
}

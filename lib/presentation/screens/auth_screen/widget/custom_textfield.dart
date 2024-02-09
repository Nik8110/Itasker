import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.suffixIcon = const SizedBox.shrink(),
    required this.controller,
    this.onTap,
    this.readOnly = false,
  });

  final String hint;
  final bool isPassword;
  final Widget suffixIcon;
  final bool readOnly;
  void Function()? onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: TextField(
        readOnly: readOnly,
        onTap: onTap ?? null,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.only(left: 10.w),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Const.kBorderContainer),
            borderRadius: BorderRadius.circular(5.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Const.kBorderContainer),
            borderRadius: BorderRadius.circular(5.r),
          ),
          hintStyle: Const.medium.copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}

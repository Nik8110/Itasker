import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.maxLength,
    this.topPadding = 0.0,
    this.width,
    this.readOnly = false,
    this.fillColor = Const.kWhite,
    required this.controller,
    this.onTap,
    this.borderColor,
    this.hintColor,
    this.validator,
  });

  final double topPadding;
  final double? width;
  final int? maxLength;
  final Color? fillColor;
  final int maxLines;
  bool readOnly;
  Color? hintColor;
  Color? borderColor;
  final String hint;
  final TextEditingController controller;
  void Function()? onTap;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        maxLines: maxLines,
        maxLength: maxLength,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          border: InputBorder.none,
          hintText: hint,
          contentPadding: EdgeInsets.only(left: 10.w, top: topPadding),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? Const.kBorderContainer),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? Const.kBorderContainer),
            borderRadius: BorderRadius.circular(10.r),
          ),
          hintStyle: Const.medium
              .copyWith(fontSize: 17.sp, color: hintColor ?? Const.kHintColor),
        ),
      ),
    );
  }
}

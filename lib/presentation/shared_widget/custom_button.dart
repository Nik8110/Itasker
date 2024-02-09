import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.style,
      this.txtStyle,
      this.child,
      required this.onTap,
      required this.title});
  final Function()? onTap;
  final String title;
  final ButtonStyle? style;
  final TextStyle? txtStyle;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r)),
                backgroundColor: Const.kBackground,
                fixedSize: Size(double.infinity, 48.h)),
        onPressed: onTap,
        child: child ??
            Center(
              child: Text(
                title,
                style: txtStyle ??
                    Const.medium.copyWith(color: Const.kWhite, fontSize: 15.sp),
              ),
            ));
  }
}

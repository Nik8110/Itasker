import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

class ChartDataWidget extends StatelessWidget {
  const ChartDataWidget(
      {Key? key, required this.title, required this.value, this.widget})
      : super(key: key);
  final String title;
  final String value;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: SizedBox(
            width: 165.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Const.medium.copyWith(fontSize: 15.sp)),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 140.w,
              child: Row(
                children: [
                  Text(value,
                      style: Const.medium.copyWith(
                          fontSize: 17.sp, fontWeight: FontWeight.w600)),
                  SizedBox(width: 5.w),
                  SizedBox(child: widget)
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

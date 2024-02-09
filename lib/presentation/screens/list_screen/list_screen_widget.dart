import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/constants.dart';

class RadioListTileWidget extends StatelessWidget {
  RadioListTileWidget({
    super.key,
    required this.onChanged,
    required this.groupValue,
    required this.title,
    required this.value,
  });

  void Function(Object?)? onChanged;
  Object groupValue;
  String title;
  Object value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: RadioListTile(
        title: Text(title, style: Const.medium.copyWith(fontSize: 15.sp)),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        splashRadius: 0,
        visualDensity: VisualDensity.comfortable,
        contentPadding: const EdgeInsets.all(0),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title});

  bool value;
  void Function(bool?)? onChanged;
  String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Row(
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
              splashRadius: 0,
              side: MaterialStateBorderSide.resolveWith(
                (states) =>
                    const BorderSide(width: 1.0, color: Const.kBorderContainer),
              ),
            ),
          ),
          Text(
            title,
            style: Const.medium.copyWith(fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}

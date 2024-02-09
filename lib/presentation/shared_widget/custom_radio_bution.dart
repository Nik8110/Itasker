import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/constants.dart';

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        child: Row(
          children: [
            CustomRadioButton(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
                colorbackground: Const.kWhite),
            const SizedBox(width: 12),
            Text(
              title,
              style: Const.medium
                  .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String? leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;
  final Color colorbackground;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.leading,
    required this.colorbackground,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
// final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: SizedBox(height: 20.h, width: 20.h, child: _customRadioButton),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.w),
      decoration: BoxDecoration(
        color: isSelected ? colorbackground : colorbackground,
        shape: BoxShape.circle,
        border: Border.all(
          width: isSelected ? 5.h : 2,
          color: isSelected ? Const.kBlue : Const.kBorderContainer,
        ),
      ),
    );
  }
}

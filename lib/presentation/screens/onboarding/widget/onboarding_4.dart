import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/gen/assets.gen.dart';

class OnBoarding4 extends StatelessWidget {
  const OnBoarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.images.boarding4.image(height: 311.h),
        SizedBox(
          height: 30.h,
        ),
        Text(
          Strings.boardingDes4,
          textAlign: TextAlign.center,
          style: Const.medium.copyWith(
              color: Const.kBackground,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp),
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            Strings.boardingSubDes4,
            textAlign: TextAlign.center,
            style: Const.small.copyWith(
                color: Const.kBlack,
                fontWeight: FontWeight.w700,
                fontSize: 15.sp),
          ),
        )
      ],
    );
  }
}

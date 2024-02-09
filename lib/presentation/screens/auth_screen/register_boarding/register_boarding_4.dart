import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/gen/assets.gen.dart';

class RegisterBoarding4 extends StatelessWidget {
  const RegisterBoarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      body: Padding(
        padding: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  Strings.adjustAddress,
                  style: Const.bold
                      .copyWith(fontSize: 30.sp, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  Strings.adjustAddressDesc,
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.normal),
                ),
                const Spacer(),
                Row(
                  children: [
                    Assets.svg.location.svg(height: 42.h, width: 42.w),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Av. Dos de Mayo 1498, San Isidro 15073",
                      style: Const.medium.copyWith(fontSize: 15.sp),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

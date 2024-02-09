import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/presentation/screens/auth_screen/widget/custom_textfield.dart';

class RegisterBoarding1 extends StatelessWidget {
  const RegisterBoarding1({
    super.key,
    required TextEditingController email,
  }) : _email = email;

  final TextEditingController _email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            Strings.creatingAccount,
            style: Const.bold
                .copyWith(fontSize: 30.sp, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            Strings.creatingAccountDesc,
            style: Const.medium.copyWith(color: Const.kBlack, fontSize: 15.sp),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            Strings.forgotEmail,
            style: Const.medium.copyWith(color: Const.kBlack, fontSize: 13.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
            controller: _email,
            hint: Strings.forgotHintEmail,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

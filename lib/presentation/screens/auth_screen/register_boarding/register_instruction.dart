import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/gen/assets.gen.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

class RegisterInstruction extends StatelessWidget {
  const RegisterInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kBackground,
      body: SafeArea(
        child: Container(
          color: Const.kWhite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Assets.images.policy.image(
                    height: 155.h, width: double.infinity, fit: BoxFit.fill),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.beforeYouStart,
                        style: Const.bold
                            .copyWith(fontSize: 30.sp, color: Const.kBlack),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        Strings.beforeYouStartDesc,
                        style: Const.medium
                            .copyWith(fontSize: 15.sp, color: Const.kBlack),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        Strings.beforeYouStartDesc2,
                        style: Const.medium
                            .copyWith(fontSize: 15.sp, color: Const.kBlack),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Assets.svg.communication.svg(height: 22.h),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            Strings.communication,
                            style: Const.medium.copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: Const.kBlack),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        Strings.communicationDesc,
                        style: Const.medium
                            .copyWith(fontSize: 15.sp, color: Const.kBlack),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Assets.svg.commitment.svg(height: 22.h),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            Strings.commitment,
                            style: Const.medium.copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: Const.kBlack),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        Strings.commitmentDesc,
                        style: Const.medium
                            .copyWith(fontSize: 15.sp, color: Const.kBlack),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Assets.svg.task.svg(height: 22.h),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            Strings.task,
                            style: Const.medium.copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: Const.kBlack),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        Strings.taskDesc,
                        style: Const.medium
                            .copyWith(fontSize: 15.sp, color: Const.kBlack),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Assets.svg.security.svg(height: 22.h),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            Strings.security,
                            style: Const.medium.copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: Const.kBlack),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        Strings.securityDesc,
                        style: Const.medium
                            .copyWith(fontSize: 15.sp, color: Const.kBlack),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        Strings.securityDesc2,
                        style: Const.medium.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w900,
                            color: Const.kBlack),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomButton(
                        onTap: () =>
                            Navigator.pushNamed(context, AppRouter.register),
                        title: Strings.agree,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomButton(
                        onTap: () => Navigator.pop(context),
                        style: Const.buttonBorderStyle,
                        title: Strings.notAgree,
                        txtStyle: Const.bold
                            .copyWith(fontSize: 15.sp, color: Const.kBlack),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/gen/assets.gen.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      appBar: AppBar(
        backgroundColor: Const.kWhite,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child:
                const Icon(Icons.arrow_back_ios_rounded, color: Const.kBlack)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              Strings.signup,
              style: Const.bold
                  .copyWith(fontSize: 30.sp, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              Strings.signupDesc,
              style:
                  Const.medium.copyWith(color: Const.kBlack, fontSize: 13.sp),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
              onTap: () =>
                  Navigator.pushNamed(context, AppRouter.registerOnboarding),
              style: Const.buttonBorderStyle,
              title: "",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Assets.svg.mail.svg(width: 24.w, height: 24.h),
                  SizedBox(
                    width: 53.w,
                  ),
                  Text(
                    Strings.registerWithEmail,
                    style: Const.medium.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w800,
                        color: Const.kBlack),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
              onTap: () =>
                  Navigator.pushNamed(context, AppRouter.registerOnboarding),
              style: Const.buttonBorderStyle,
              title: "",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Assets.images.facebook.image(width: 24.w, height: 24.h),
                  SizedBox(
                    width: 53.w,
                  ),
                  Text(
                    Strings.facebook,
                    style: Const.medium.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w800,
                        color: Const.kBlack),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
              onTap: () =>
                  Navigator.pushNamed(context, AppRouter.registerOnboarding),
              style: Const.buttonBorderStyle,
              title: "",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Assets.images.google.image(width: 24.w, height: 24.h),
                  SizedBox(
                    width: 53.w,
                  ),
                  Text(
                    Strings.google,
                    style: Const.medium.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w800,
                        color: Const.kBlack),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

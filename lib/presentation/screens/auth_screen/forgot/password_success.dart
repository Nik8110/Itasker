import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/gen/assets.gen.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

class PasswordSuccess extends StatefulWidget {
  const PasswordSuccess({super.key, this.name, this.isRegister = false});
  final String? name;
  final bool isRegister;

  @override
  State<PasswordSuccess> createState() => _PasswordSuccessState();
}

class _PasswordSuccessState extends State<PasswordSuccess> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kBackground,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Assets.images.passwordSuccess
                  .svg(height: 110.h, width: 110.w),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              widget.isRegister
                  ? Strings.welcome + widget.name!
                  : Strings.passUpdated,
              style: Const.bold.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: Const.kWhite),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                widget.isRegister
                    ? Strings.successRegin
                    : Strings.passUpdatedSuccess,
                textAlign: TextAlign.center,
                style: Const.medium.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.normal,
                    color: Const.kWhite),
              ),
            ),
            const Spacer(),
            widget.isRegister
                ? const SizedBox.shrink()
                : CustomButton(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context, AppRouter.login, (route) => false),
                    title: Strings.loginButton,
                    txtStyle: Const.medium.copyWith(
                        color: Const.kBlack,
                        fontWeight: FontWeight.w800,
                        fontSize: 15.sp),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity, 48.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        backgroundColor: Const.kWhite),
                  )
          ],
        ),
      ),
    );
  }
}

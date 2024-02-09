import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/gen/assets.gen.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/screens/auth_screen/widget/custom_textfield.dart';

import '../../../application/constants.dart';
import '../../../application/string.dart';
import '../../shared_widget/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool newPassShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.h.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 25.h,
              ),
              Text(
                Strings.login,
                style: Const.bold.copyWith(fontSize: 32.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                Strings.loginDes,
                style: Const.medium.copyWith(fontSize: 15.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                Strings.email,
                style: Const.medium.copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomTextField(
                controller: _email,
                hint: Strings.email,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                Strings.password,
                style: Const.medium.copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomTextField(
                controller: _password,
                hint: Strings.password,
                isPassword: newPassShow,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      newPassShow = !newPassShow;
                    });
                  },
                  child: Icon(
                      newPassShow
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: Const.kBorder),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomButton(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, AppRouter.landingScreen, (route) => false),
                title: Strings.submit,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.registerInstruction),
                style: Const.buttonBorderStyle,
                title: Strings.register,
                txtStyle:
                    Const.bold.copyWith(fontSize: 15.sp, color: Const.kBlack),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  const Expanded(
                      child:
                          Divider(thickness: 1, color: Const.kBorderContainer)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "o",
                    style: Const.medium
                        .copyWith(color: Const.kBorder, fontSize: 15.sp),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Const.kBorderContainer,
                  )),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onTap: () {},
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
                      style: Const.bold
                          .copyWith(fontSize: 15.sp, color: Const.kBlack),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                onTap: () {},
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
                      style: Const.bold
                          .copyWith(fontSize: 15.sp, color: Const.kBlack),
                    )
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.forgotScreen),
                child: Center(
                    child: Text(
                  Strings.forgetPass,
                  style: Const.medium.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Const.kBlack),
                )),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

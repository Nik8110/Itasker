import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/string.dart';

import '../../../../application/constants.dart';
import '../widget/custom_textfield.dart';

class RegisterBoarding2 extends StatefulWidget {
  const RegisterBoarding2({super.key});

  @override
  State<RegisterBoarding2> createState() => _RegisterBoarding2State();
}

class _RegisterBoarding2State extends State<RegisterBoarding2> {
  final TextEditingController _email = TextEditingController();
  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;
  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              Strings.verifyEmail,
              style: Const.bold
                  .copyWith(fontSize: 30.sp, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              Strings.verifyEmailDesc,
              style:
                  Const.medium.copyWith(color: Const.kBlack, fontSize: 15.sp),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              Strings.enterCodeTxt,
              style:
                  Const.medium.copyWith(color: Const.kBlack, fontSize: 13.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              controller: _email,
              hint: Strings.enterCodeTxtHint,
            ),
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: Text(
                "${Strings.resend}${secondsRemaining}s.",
                style:
                    Const.medium.copyWith(color: Const.kBlue, fontSize: 13.sp),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }
}

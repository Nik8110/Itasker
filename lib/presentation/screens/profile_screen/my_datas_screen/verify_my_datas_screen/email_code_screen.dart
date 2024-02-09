import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/string.dart';

import '../../../../../application/constants.dart';
import '../../../../router/routes.dart';
import '../../../../shared_widget/custom_button.dart';
import '../../../auth_screen/widget/custom_textfield.dart';

class EmailCodeScreen extends StatefulWidget {
  const EmailCodeScreen({super.key});

  @override
  State<EmailCodeScreen> createState() => _EmailCodeScreenState();
}

class _EmailCodeScreenState extends State<EmailCodeScreen> {
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
            Text(
              'Verifica tu correo',
              style: Const.bold
                  .copyWith(fontSize: 30.sp, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              Strings.codeDesc,
              style:
                  Const.medium.copyWith(color: Const.kBlack, fontSize: 13.sp),
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
            const Spacer(),
            CustomButton(
                onTap: () => Navigator.pushReplacementNamed(
                    context, AppRouter.successScreen),
                title: Strings.countinue),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
                style: Const.buttonBorderStyle,
                onTap: enableResend ? _resendCode : null,
                txtStyle: Const.medium.copyWith(
                    color: Const.kBlack,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800),
                title: Strings.resendCode),
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

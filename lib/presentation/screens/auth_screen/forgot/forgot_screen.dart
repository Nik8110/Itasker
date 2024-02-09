import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../widget/custom_textfield.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});
  final TextEditingController _email = TextEditingController();
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
        title: Text(
          Strings.forgot,
          style: Const.medium.copyWith(
              color: Const.kBlack,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700),
        ),
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 7),
            child: LinearProgressIndicator(
              value: 0.1,
              valueColor: AlwaysStoppedAnimation<Color>(Const.kBackground),
              backgroundColor: Const.kProgressBorder,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              Strings.forgotDesc,
              style: Const.medium
                  .copyWith(fontSize: 15.sp, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              Strings.forgotEmail,
              style:
                  Const.medium.copyWith(color: Const.kBlack, fontSize: 13.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              controller: _email,
              hint: Strings.forgotHintEmail,
            ),
            const Spacer(),
            CustomButton(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.pinCodeScreen),
                title: Strings.countinue),
          ],
        ),
      ),
    );
  }
}

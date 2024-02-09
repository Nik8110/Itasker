import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/presentation/screens/auth_screen/widget/custom_textfield.dart';

import '../../../../router/routes.dart';
import '../../../../shared_widget/custom_button.dart';

class ChangeEmailScreen extends StatelessWidget {
  ChangeEmailScreen({super.key});

  TextEditingController _email = TextEditingController();

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
        padding: EdgeInsets.all(20.h.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cambiar el correo de tu cuenta',
              style: Const.bold
                  .copyWith(fontSize: 30.sp, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              Strings.creatingAccountDesc,
              style:
                  Const.medium.copyWith(color: Const.kBlack, fontSize: 15.sp),
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
                onTap: () => Navigator.pushReplacementNamed(
                    context, AppRouter.emailCodeScreen),
                title: 'Continuar'),
          ],
        ),
      ),
    );
  }
}

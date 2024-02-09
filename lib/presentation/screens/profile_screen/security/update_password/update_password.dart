import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/screens/auth_screen/widget/custom_textfield.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../../../../application/constants.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController _email = TextEditingController();
  bool confirmPassShow = false;
  bool newPassShow = false;
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
              Strings.updatePassword,
              style: Const.bold
                  .copyWith(fontSize: 30.sp, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              Strings.updatePasswordDesc,
              style:
                  Const.medium.copyWith(color: Const.kBlack, fontSize: 13.sp),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              Strings.newPass,
              style: Const.medium.copyWith(
                  color: Const.kBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              controller: _email,
              hint: Strings.passHint,
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
              height: 5.h,
            ),
            Text(
              Strings.passNotes,
              style: Const.medium
                  .copyWith(color: Const.kBlackShade2, fontSize: 13.sp),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              Strings.confirmPass,
              style: Const.medium.copyWith(
                  color: Const.kBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              controller: _email,
              hint: Strings.passHint,
              isPassword: confirmPassShow,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    confirmPassShow = !confirmPassShow;
                  });
                },
                child: Icon(
                    confirmPassShow
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    color: Const.kBorder),
              ),
            ),
            const Spacer(),
            CustomButton(
                onTap: () => Navigator.pushNamed(
                    context, AppRouter.passwordSuccess,
                    arguments: {"isRegister": false, "name": ""}),
                title: Strings.countinue),
          ],
        ),
      ),
    );
  }
}

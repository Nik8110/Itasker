import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/string.dart';

import '../../../../application/constants.dart';
import '../widget/custom_textfield.dart';

class RegisterBoarding3 extends StatefulWidget {
  const RegisterBoarding3({super.key});

  @override
  State<RegisterBoarding3> createState() => _RegisterBoarding3State();
}

class _RegisterBoarding3State extends State<RegisterBoarding3> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool newPassShow = true;
  bool confirmPassShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  Strings.completeDetails,
                  style: Const.bold
                      .copyWith(fontSize: 30.sp, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 20.h,
                ),

                /// Full Name
                Text(
                  Strings.fullName,
                  style: Const.medium.copyWith(
                      color: Const.kBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  controller: _name,
                  hint: Strings.fullName,
                ),
                SizedBox(
                  height: 20.h,
                ),

                /// DOB
                Text(
                  Strings.dateOfBirth,
                  style: Const.medium.copyWith(
                      color: Const.kBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: CustomTextField(
                    controller: _dob,
                    hint: Strings.dateOfBirthHint,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: Const.kBackground,
                                  onPrimary: Const.kWhite,
                                  onSurface: Const.kBlack,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Const.kBackground),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2030));
                      if (pickedDate != null) {
                        setState(() {
                          _dob.text =
                              '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                /// New Password
                Text(
                  Strings.newPass,
                  style: Const.medium.copyWith(
                      color: Const.kBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  controller: _newPass,
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
                  hint: Strings.passHint,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  Strings.passNotes,
                  style: Const.medium
                      .copyWith(color: Const.kBlackShade2, fontSize: 13.sp),
                ),

                /// Confirm Password

                SizedBox(
                  height: 20.h,
                ),
                Text(
                  Strings.confirmPass,
                  style: Const.medium.copyWith(
                      color: Const.kBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  controller: _confirmPass,
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
                SizedBox(
                  height: 30.h,
                ),
                RichText(
                  text: TextSpan(
                      text: "${Strings.policy1} ",
                      style: Const.medium.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                            text: Strings.policy2,
                            style: Const.medium.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Const.kBlue)),
                        TextSpan(
                            text: " y ",
                            style: Const.medium.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Const.kBlack)),
                        TextSpan(
                            text: Strings.policy3,
                            style: Const.medium.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Const.kBlue)),
                        TextSpan(
                            text: " ${Strings.policy4}",
                            style: Const.medium.copyWith(
                              fontWeight: FontWeight.w500,
                            ))
                      ]),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

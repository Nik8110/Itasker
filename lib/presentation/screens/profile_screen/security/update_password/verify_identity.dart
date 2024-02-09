import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/screens/auth_screen/widget/custom_textfield.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

class VerifyIdentity extends StatefulWidget {
  const VerifyIdentity({this.isDelAc = false, super.key});
  final bool isDelAc;
  @override
  State<VerifyIdentity> createState() => _VerifyIdentityState();
}

class _VerifyIdentityState extends State<VerifyIdentity> {
  final TextEditingController _email = TextEditingController();
  bool newPassShow = true;
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
              Strings.verifyIdentity,
              style: Const.medium
                  .copyWith(fontSize: 30.sp, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 11.h,
            ),
            Text(
              Strings.verifyIdentityDesc,
              style:
                  Const.medium.copyWith(color: Const.kBlack, fontSize: 15.sp),
            ),
            SizedBox(
              height: 21.h,
            ),
            Text(
              Strings.currentPassword,
              style: Const.medium.copyWith(
                  color: Const.kBlack,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              controller: _email,
              hint: Strings.passHint,
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
            const Spacer(),
            CustomButton(
                onTap: () => widget.isDelAc
                    ? showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Padding(
                            padding: EdgeInsets.all(20.h.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      Strings.delAc,
                                      style: Const.medium.copyWith(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: const Icon(Icons.close))
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  Strings.delAcWarn,
                                  style: Const.medium.copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          txtStyle: Const.medium.copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                          style: Const.buttonBorderStyle,
                                          title: Strings.no),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: CustomButton(
                                          onTap: () {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                AppRouter.landingScreen,
                                                arguments: 4,
                                                (route) => false);
                                          },
                                          title: Strings.yes),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Navigator.pushNamed(
                        context, AppRouter.updatePasswordScreen),
                title: Strings.verify),
          ],
        ),
      ),
    );
  }
}

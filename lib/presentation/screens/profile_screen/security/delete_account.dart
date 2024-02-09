import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Const.kBackground,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child:
                const Icon(Icons.arrow_back_ios_rounded, color: Const.kWhite)),
        centerTitle: true,
        title: Text(
          Strings.delAc,
          style: Const.medium.copyWith(
              color: Const.kWhite,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Const.kWhite,
            padding: EdgeInsets.all(20.h.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.delAc,
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  Strings.delAcDesc,
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.verifyIdentity,
                          arguments: true);
                    },
                    style: Const.buttonBorderStyle,
                    txtStyle: Const.medium.copyWith(
                        color: Const.kBlack,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600),
                    title: Strings.delAc)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

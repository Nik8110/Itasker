import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/presentation/router/routes.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

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
          Strings.security,
          style: Const.medium.copyWith(
              color: Const.kWhite,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            tileColor: Const.kWhite,
            onTap: () => Navigator.pushNamed(context, AppRouter.verifyIdentity,
                arguments: false),
            title: Text(
              Strings.updatePassword,
              style: Const.medium
                  .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            trailing: const Icon(
                size: 20,
                Icons.arrow_forward_ios_rounded,
                color: Const.kBlackShade3),
          ),
          ListTile(
            tileColor: Const.kWhite,
            onTap: () =>
                Navigator.pushNamed(context, AppRouter.deleteAccountScreen),
            title: Text(
              Strings.delAc,
              style: Const.medium
                  .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            trailing: const Icon(
                size: 20,
                Icons.arrow_forward_ios_rounded,
                color: Const.kBlackShade3),
          ),
        ],
      ),
    );
  }
}

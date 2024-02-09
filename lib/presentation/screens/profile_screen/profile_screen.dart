import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../../application/string.dart';
import '../../../gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kBackground,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Const.kBackground,
              height: 130.h,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(20.h.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pedro Vasquez",
                          style: Const.bold
                              .copyWith(fontSize: 22.sp, color: Const.kWhite),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "ejemplo@gmail.com",
                          style: Const.medium.copyWith(
                              color: Const.kWhite,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w200),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Ver Perfil como usuario >",
                          style: Const.small.copyWith(
                              color: Const.kWhite,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Const.kWhite,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(20.h.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.acSetting,
                        style: Const.bold.copyWith(
                            fontSize: 22.sp, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(
                            context, AppRouter.myDatasScreen),
                        leading:
                            const Icon(Icons.person, color: Const.kBlackShade6),
                        horizontalTitleGap: 0,
                        title: Text(
                          Strings.myData,
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                        ),
                        contentPadding: EdgeInsets.zero,
                        trailing: const Icon(
                            size: 20,
                            Icons.arrow_forward_ios_rounded,
                            color: Const.kBlackShade3),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(
                            context, AppRouter.myProfileScreen),
                        leading: Assets.images.idCard
                            .image(height: 24.h, width: 24.w),
                        horizontalTitleGap: 0,
                        title: Text(
                          Strings.myProfileTile,
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                        ),
                        contentPadding: EdgeInsets.zero,
                        trailing: const Icon(
                            size: 20,
                            Icons.arrow_forward_ios_rounded,
                            color: Const.kBlackShade3),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(
                            context, AppRouter.billingScreen),
                        leading: const Icon(Icons.savings,
                            color: Const.kBlackShade6),
                        horizontalTitleGap: 0,
                        title: Text(
                          Strings.billing,
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                        ),
                        contentPadding: EdgeInsets.zero,
                        trailing: const Icon(
                            size: 20,
                            Icons.arrow_forward_ios_rounded,
                            color: Const.kBlackShade3),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(
                            context, AppRouter.performanceAsTaskerScreen),
                        leading: Assets.images.statistics
                            .image(height: 24.h, width: 24.w),
                        horizontalTitleGap: 0,
                        title: Text(
                          Strings.performance,
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                        ),
                        contentPadding: EdgeInsets.zero,
                        trailing: const Icon(
                            size: 20,
                            Icons.arrow_forward_ios_rounded,
                            color: Const.kBlackShade3),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(
                            context, AppRouter.securityScreen),
                        leading: const Icon(Icons.security,
                            color: Const.kBlackShade6),
                        horizontalTitleGap: 0,
                        title: Text(
                          Strings.security,
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                        ),
                        contentPadding: EdgeInsets.zero,
                        trailing: const Icon(
                            size: 20,
                            Icons.arrow_forward_ios_rounded,
                            color: Const.kBlackShade3),
                      ),
                      ListTile(
                        onTap: () =>
                            Navigator.pushNamed(context, AppRouter.aboutScreen),
                        leading: Assets.images.information
                            .image(height: 24.h, width: 24.w),
                        horizontalTitleGap: 0,
                        title: Text(
                          Strings.info,
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                        ),
                        contentPadding: EdgeInsets.zero,
                        trailing: const Icon(
                            size: 20,
                            Icons.arrow_forward_ios_rounded,
                            color: Const.kBlackShade3),
                      ),
                      const Spacer(),
                      CustomButton(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: Padding(
                                padding: EdgeInsets.all(20.h.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Cerrar sesión',
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
                                      '¿Seguro que deseas cerrar sesión?',
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
                                              onTap: () =>
                                                  Navigator.pop(context),
                                              title: Strings.yes),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        style: Const.buttonBorderStyle,
                        txtStyle: Const.medium.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        title: Strings.logout,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

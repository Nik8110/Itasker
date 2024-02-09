import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

import '../../../../gen/assets.gen.dart';
import '../../../router/routes.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: appBarWidget(
        context,
        title: 'Acerca De',
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 350.h,
            color: Const.kWhite,
            alignment: Alignment.center,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                Assets.svg.about.svg(),
                SizedBox(height: 28.h),
                Assets.svg.aboutName.svg(),
                SizedBox(height: 32.h),
                Text(
                  'iTasker',
                  style: Const.medium
                      .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10.h),
                Text(
                  'v. 1. 01',
                  style: Const.medium.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Const.kBlackShade4,
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Copyright © 2023 iTasker Company S.A.S',
                  style: Const.medium.copyWith(
                      fontSize: 15.sp,
                      color: Const.kBlackShade4,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            color: Const.kWhite,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Sobre Nosotros',
                    style: Const.medium
                        .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700),
                  ),
                  contentPadding: EdgeInsets.zero,
                  trailing: const Icon(
                      size: 20,
                      Icons.arrow_forward_ios_rounded,
                      color: Const.kBlackShade3),
                ),
                ListTile(
                  onTap: () => Navigator.pushNamed(
                    arguments: {
                      'title': 'Términos y Condiciones',
                      'desc':
                          'ABRE UN\nE-FRAME DE LA\nPÁGINA DE TÉRMINOS\nY CONDICIONES'
                    },
                    context,
                    AppRouter.termsCcnditionDataPolicyScreen,
                  ),
                  title: Text(
                    'Términos y Condiciones',
                    style: Const.medium
                        .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700),
                  ),
                  contentPadding: EdgeInsets.zero,
                  trailing: const Icon(
                      size: 20,
                      Icons.arrow_forward_ios_rounded,
                      color: Const.kBlackShade3),
                ),
                ListTile(
                  onTap: () => Navigator.pushNamed(
                    arguments: {
                      'title': 'Políticas de Datos',
                      'desc':
                          'ABRE UN\nE-FRAME DE LA\nPÁGINA DE POLÍTICAS\nDE DATOS'
                    },
                    context,
                    AppRouter.termsCcnditionDataPolicyScreen,
                  ),
                  title: Text(
                    'Políticas de Datos',
                    style: Const.medium
                        .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700),
                  ),
                  contentPadding: EdgeInsets.zero,
                  trailing: const Icon(
                      size: 20,
                      Icons.arrow_forward_ios_rounded,
                      color: Const.kBlackShade3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

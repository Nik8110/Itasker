import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/presentation/router/routes.dart';

import '../../../../application/constants.dart';
import '../../../../gen/assets.gen.dart';

class SuccessScreen2 extends StatelessWidget {
  const SuccessScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamedAndRemoveUntil(
          context, AppRouter.landingScreen, (route) => false),
      child: Scaffold(
        backgroundColor: Const.kBackground,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Assets.images.passwordSuccess
                    .svg(height: 110.h, width: 110.w)),
            SizedBox(height: 40.h),
            Text('Aplicaste a la\nTarea#123 con éxito',
                textAlign: TextAlign.center,
                style: Const.medium.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: Const.kWhite)),
          ],
        ),
      ),
    );
  }
}

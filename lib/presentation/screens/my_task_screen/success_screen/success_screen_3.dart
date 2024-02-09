import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/presentation/router/routes.dart';
import '../../../../application/constants.dart';
import '../../../../gen/assets.gen.dart';

class SuccessScreen3 extends StatefulWidget {
  final bool isTrue;

  const SuccessScreen3({super.key, this.isTrue = false});

  @override
  State<SuccessScreen3> createState() => _SuccessScreen3State();
}

class _SuccessScreen3State extends State<SuccessScreen3> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isTrue
          ? () => Navigator.pushReplacementNamed(
              context, arguments: true, AppRouter.finishedScreen)
          : () =>
              Navigator.pushReplacementNamed(context, AppRouter.landingScreen),
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
            Text('Calificación enviada\ncon éxito',
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

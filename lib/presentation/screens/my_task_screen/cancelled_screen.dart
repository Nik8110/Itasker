import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../application/constants.dart';

class CancelledScreen extends StatelessWidget {
  const CancelledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarWidget(context),
            SizedBox(height: 20.h),
            Text('Tarea #123',
                style: Const.medium
                    .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
            SizedBox(height: 10.h),
            Container(
                width: 95.w,
                height: 35.h,
                padding: EdgeInsets.all(8.h.w),
                decoration: BoxDecoration(
                    color: Const.kBlackShade10.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(19.r)),
                alignment: Alignment.center,
                child: Text('Cancelada',
                    style: Const.medium.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Const.kBlackShade10))),
            SizedBox(height: 13.h),
            Text('11/03/2022 - 10:00 hrs.',
                style: Const.medium.copyWith(fontSize: 15.sp)),
            SizedBox(height: 20.h),
            ListWidget(itemCount: 10),
            ListTile(
              title: Text('Ofertas y contraofertas',
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700)),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: 20.h.w, color: Const.kBlackShade3),
            ),
            ListTile(
              title: Text('Preguntas y respuestas',
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700)),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: 20.h.w, color: Const.kBlackShade3),
            ),
            ListTile(
              title: Text('Ver tarea',
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700)),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: 20.h.w, color: Const.kBlackShade3),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

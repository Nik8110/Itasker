import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../application/constants.dart';
import '../../router/routes.dart';

class InProgressScreen extends StatelessWidget {
  const InProgressScreen({super.key});

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
                    color: Const.kBLueShade1.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(19.r)),
                alignment: Alignment.center,
                child: Text('En Curso',
                    style: Const.medium.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Const.kBLueShade1))),
            SizedBox(height: 13.h),
            Text('11/03/2022 - 10:00 hrs.',
                style: Const.medium.copyWith(fontSize: 15.sp)),
            SizedBox(height: 20.h),
            Divider(thickness: 10.h, color: Const.kScaffoldBackground),
            ListTile(
                onTap: () {},
                leading: const CircleAvatar(),
                title: Text('Chat con Tasker',
                    style: Const.medium.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w700)),
                subtitle: Text('Carla G.',
                    style: Const.medium.copyWith(fontSize: 15.sp)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 13.h.w,
                      backgroundColor: Const.kBlue,
                      child: Text('3',
                          style: Const.medium.copyWith(
                              fontSize: 13.sp,
                              color: Const.kWhite,
                              fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(width: 12.w),
                    Icon(Icons.arrow_forward_ios_rounded,
                        color: Const.kBlackShade3, size: 20.h.w),
                  ],
                )),
            ListWidget(itemCount: 10),
            ListTile(
              onTap: () => Navigator.pushNamed(
                  context, AppRouter.offerorChatBudgetScreen),
              title: Text('Ver tarea',
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700)),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: 20.h.w, color: Const.kBlackShade3),
            ),
            ListTile(
                onTap: () => Navigator.pushNamed(
                    context, AppRouter.completionCodeScreen),
                title: Text('Código de Finalización',
                    style: Const.medium.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w700)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 13.h.w,
                      backgroundColor: Const.kBlue,
                      child: Text('1',
                          style: Const.medium.copyWith(
                              fontSize: 13.sp,
                              color: Const.kWhite,
                              fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(width: 12.w),
                    Icon(Icons.arrow_forward_ios_rounded,
                        color: Const.kBlackShade3, size: 20.h.w),
                  ],
                )),
            ListTile(
              title: Text('Necesito Ayuda',
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

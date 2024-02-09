import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/router/routes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, title: 'Notificaciones'),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(radius: 24.r),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tarea finalizada!',
                    style: Const.medium
                        .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 275.w,
                    child: Text(
                      'Felicitaciones has finalizado una tarea. Tu pago se verá reflejado en tu billetera virtual',
                      style: Const.medium.copyWith(fontSize: 13.sp),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 275.w,
                    child: Row(
                      children: [
                        Icon(Icons.access_time_filled_rounded,
                            color: Const.kBlackShade2, size: 20.h.w),
                        SizedBox(width: 10.w),
                        Text(
                          'Hoy, 07:51 PM',
                          style: Const.medium.copyWith(
                              fontSize: 13.sp, color: Const.kBlackShade1),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRouter.offerorChatScreen,
                          ),
                          child: Text(
                            'Chatear',
                            style: Const.medium
                                .copyWith(fontSize: 15.sp, color: Const.kBlue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

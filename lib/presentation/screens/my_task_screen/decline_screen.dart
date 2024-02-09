import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

import '../../router/routes.dart';

class DeclineScreen extends StatelessWidget {
  const DeclineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: appBarWidget(context),
      body: Card(
        margin: EdgeInsets.all(10.h.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Const.kBackground),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Carla G.',
                              style: Const.medium.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Text(
                                '5.0',
                                style: Const.medium.copyWith(
                                    fontSize: 13.sp,
                                    color: Const.kYellowShade1),
                              ),
                              SizedBox(width: 5.w),
                              const Icon(Icons.star,
                                  color: Const.kYellowShade1),
                              SizedBox(width: 5.w),
                              Flexible(
                                child: Text(
                                  '(4) | Hoy, 04:00 PM',
                                  style: Const.medium.copyWith(
                                      fontSize: 13.sp,
                                      color: Const.kBlackShade6),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.h),
                        ],
                      ),
                      trailing: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, AppRouter.viewProfileAsUserScreen,
                            arguments: false),
                        child: Text(
                          'Ver Perfil',
                          style: Const.medium.copyWith(
                            fontSize: 13.sp,
                            color: Const.kBlueShad2,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Proin congue dolor at eros tempor congue. Sed est augue, egestas in purus id, dictum malesuada sapien. Donec imperdiet ex nibh, efficitur imperdiet elit pellentesque sed. Integer condimentum massa eget mattis consectetur. Proin congue dolor at eros tempor congue. Sed est augue, egestas in purus id, dictum malesuada sapien.',
                      style: Const.medium
                          .copyWith(fontSize: 13.sp, color: Const.kBlackShade5),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: Const.kBackground, size: 16.h.w),
                        SizedBox(width: 5.w),
                        Flexible(
                          child: Text(
                            'Santiago Centro, Santiago, Chile',
                            style: Const.medium.copyWith(
                                fontSize: 11.sp, color: Const.kBlackShade1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(color: Const.kBorderContainer, thickness: 1),
              SizedBox(height: 7.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Su oferta:',
                        style: Const.medium.copyWith(fontSize: 15.sp)),
                    Text('\$15.500',
                        style: Const.medium.copyWith(
                            fontSize: 17.sp, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              const Divider(color: Const.kBorderContainer, thickness: 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 48.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(color: Const.kRedShade1)),
                      alignment: Alignment.center,
                      child: Text('Rechazar',
                          style: Const.medium.copyWith(
                              fontSize: 15.sp,
                              color: Const.kRedShade1,
                              fontWeight: FontWeight.w700)),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, AppRouter.acceptScreen),
                      child: Container(
                        height: 48.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Const.kGreenShade2,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        alignment: Alignment.center,
                        child: Text('Aceptar',
                            style: Const.medium.copyWith(
                                fontSize: 15.sp,
                                color: Const.kWhite,
                                fontWeight: FontWeight.w700)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

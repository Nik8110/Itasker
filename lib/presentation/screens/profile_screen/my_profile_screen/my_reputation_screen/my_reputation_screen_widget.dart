import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/gen/assets.gen.dart';

class ContainerWidget extends StatelessWidget {
  double width;

  ContainerWidget({super.key, this.width = 260});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Const.kWhite,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.h.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Evaluación',
                    style: Const.medium.copyWith(
                        fontSize: 15.sp,
                        color: Const.kBlack,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 17.h),
                  Padding(
                    padding: EdgeInsets.only(left: 51.w),
                    child: Row(
                      children: [
                        Text(
                          '5.0',
                          style: Const.medium.copyWith(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: Const.kBlack),
                        ),
                        SizedBox(width: 10.w),
                        Assets.images.star.image(height: 24.h, width: 24.w),
                        SizedBox(width: 10.w),
                        RichWidget(
                          text: 'Basado en',
                          style: Const.medium
                              .copyWith(fontSize: 15.sp, color: Const.kBlack),
                          span: [
                            TextSpan(
                              text: ' 1 ',
                              style: Const.medium.copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                                color: Const.kBlack,
                              ),
                            ),
                            TextSpan(
                              text: 'evaluación',
                              style: Const.medium.copyWith(
                                fontSize: 15.sp,
                                color: Const.kBlack,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.only(left: 73.w),
                    child: Row(
                      children: [
                        Text(
                          '1',
                          style: Const.medium.copyWith(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w600,
                              color: Const.kBlack),
                        ),
                        SizedBox(width: 10.w),
                        Assets.images.tick.image(height: 24.h, width: 24.w),
                        SizedBox(width: 10.w),
                        Text(
                          'Tareas realizadas',
                          style: Const.medium.copyWith(
                            fontSize: 15.sp,
                            color: Const.kBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.all(20.h.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reseñas (2)',
                    style: Const.medium.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Const.kBlack),
                  ),
                  SizedBox(height: 19.h),
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 32.r),
                        SizedBox(width: 10.w),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pasear a mi mascota',
                              style: Const.medium.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Const.kBlack),
                            ),
                            SizedBox(height: 5.h),
                            SizedBox(
                              width: 235.w,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consecte adiping elit. Donec non a nisl iaculis gravida in eget ante. Ut sem ligula.',
                                style: Const.medium.copyWith(
                                    fontSize: 13.sp, color: Const.kBlack),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            RichWidget(
                              text: 'por',
                              style: Const.medium.copyWith(
                                  fontSize: 13.sp, color: Const.kBlackShade7),
                              span: [
                                TextSpan(
                                  text: ' Fernando S. ',
                                  style: Const.medium.copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Const.kBlackShade7,
                                  ),
                                ),
                                TextSpan(
                                  text: '| Hoy, 04:00 PM',
                                  style: Const.medium.copyWith(
                                    fontSize: 13.sp,
                                    color: Const.kBlackShade7,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(radius: 32.r),
                      SizedBox(width: 10.w),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pasear a mi mascota',
                            style: Const.medium.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Const.kBlack),
                          ),
                          SizedBox(height: 5.h),
                          SizedBox(
                            width: 235.w,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consecte adiping elit. Donec non a nisl iaculis gravida in eget ante. Ut sem ligula.',
                              style: Const.medium.copyWith(
                                  fontSize: 13.sp, color: Const.kBlack),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          RichWidget(
                            text: 'por',
                            style: Const.medium.copyWith(
                                fontSize: 13.sp, color: Const.kBlackShade7),
                            span: [
                              TextSpan(
                                text: ' Fernando S. ',
                                style: Const.medium.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Const.kBlackShade7,
                                ),
                              ),
                              TextSpan(
                                text: '| Hoy, 04:00 PM',
                                style: Const.medium.copyWith(
                                  fontSize: 13.sp,
                                  color: Const.kBlackShade7,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

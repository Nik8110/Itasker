import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

import '../../router/routes.dart';
import '../../shared_widget/custom_button.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: appBarWidget(context,
          title: 'Checkout',
          iconColor: Const.kBlack,
          textColor: Const.kBlack,
          backgroundColor: Const.kWhite),
      body: Padding(
        padding: EdgeInsets.all(20.h.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tasker seleccionado',
                style: Const.medium
                    .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                  color: Const.kWhite,
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: Const.kBorderContainer)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.h.w),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Const.kBackground),
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
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non leo a nisl iaculis gravida in eget leo a',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Const.medium.copyWith(
                              fontSize: 13.sp, color: Const.kBlackShade5),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Const.kBorderContainer, thickness: 1.5),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Text('Presupuesto de tarea',
                style: Const.medium
                    .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                  color: Const.kWhite,
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: Const.kBorderContainer)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.h.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Presupuesto',
                                style: Const.medium.copyWith(
                                    fontSize: 17.sp,
                                    color: Const.kBlackShade5)),
                            Text('\$15.500',
                                style: Const.medium.copyWith(
                                    fontSize: 17.sp,
                                    color: Const.kBlackShade5)),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Comisión de app',
                                style: Const.medium.copyWith(
                                    fontSize: 17.sp,
                                    color: Const.kBlackShade5)),
                            Text('\$300',
                                style: Const.medium.copyWith(
                                    fontSize: 17.sp,
                                    color: Const.kBlackShade5)),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(color: Const.kBorderContainer, thickness: 1.5),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: Const.medium.copyWith(
                                fontSize: 17.sp, fontWeight: FontWeight.w700)),
                        Text('\$15.500',
                            style: Const.medium.copyWith(
                                fontSize: 17.sp, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 17.h),
            Text(
                'Al realizar tu pago, declaras estar de acuerdo con los términos de pago y de privacidad estipulados por iTasker.',
                style: Const.medium
                    .copyWith(fontSize: 13.sp, color: Const.kBlackShade6)),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Const.kWhite,
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Monto a depositar:',
                    style: Const.medium.copyWith(fontSize: 15.sp)),
                Text('\$15.800',
                    style: Const.medium.copyWith(
                        fontSize: 22.sp, fontWeight: FontWeight.w700)),
              ],
            ),
            SizedBox(height: 15.h),
            CustomButton(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.dipositNowScreen),
                title: 'Depositar ahora')
          ],
        ),
      ),
    );
  }
}

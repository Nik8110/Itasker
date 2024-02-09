import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../router/routes.dart';

class OfferAndCounterOfferScreen extends StatefulWidget {
  const OfferAndCounterOfferScreen({super.key});

  @override
  State<OfferAndCounterOfferScreen> createState() =>
      _OfferAndCounterOfferScreenState();
}

class _OfferAndCounterOfferScreenState
    extends State<OfferAndCounterOfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: appBarWidget(context, title: 'Ofertas y contraofertas (3)'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRouter.declineScreen),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
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
                            trailing: Icon(Icons.more_horiz_rounded,
                                size: 35.h, color: Const.kBlackShade1),
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
                    const Divider(color: Const.kBorderContainer),
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
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    SizedBox(height: 7.h),
                    const Divider(color: Const.kBorderContainer),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.declineScreen),
                            child: Container(
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
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.acceptScreen),
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                Text('Tu presupuesto:',
                    style: Const.medium.copyWith(fontSize: 15.sp)),
                Text('\$15.500',
                    style: Const.medium.copyWith(
                        fontSize: 22.sp, fontWeight: FontWeight.w700)),
              ],
            ),
            SizedBox(height: 15.h),
            CustomButton(onTap: () {}, title: 'Contraofertar')
          ],
        ),
      ),
    );
  }
}

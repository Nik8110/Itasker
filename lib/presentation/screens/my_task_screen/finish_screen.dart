import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

import '../../router/routes.dart';
import '../../shared_widget/custom_button.dart';

class FinishedScreen extends StatefulWidget {
  final bool isShow;

  const FinishedScreen({super.key, required this.isShow});

  @override
  State<FinishedScreen> createState() => _FinishedScreenState();
}

class _FinishedScreenState extends State<FinishedScreen> {
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
                    color: Const.kGreenShade1.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(19.r)),
                alignment: Alignment.center,
                child: Text('Finalizada',
                    style: Const.medium.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Const.kGreenShade1))),
            SizedBox(height: 13.h),
            Text('11/03/2022 - 10:00 hrs.',
                style: Const.medium.copyWith(fontSize: 15.sp)),
            SizedBox(height: 20.h),
            Divider(thickness: 10.h, color: Const.kScaffoldBackground),
            ListTile(
              onTap: () =>
                  Navigator.pushNamed(context, AppRouter.taskerChatScreen),
              leading: const CircleAvatar(),
              title: Text('Chat con Tasker',
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700)),
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
              ),
            ),
            Divider(thickness: 10.h, color: Const.kScaffoldBackground),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Calificaste al Tasker con:',
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w700)),
                      widget.isShow
                          ? GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context,
                                  arguments: true,
                                  AppRouter.viewProfileAsUserScreen),
                              child: Text('Ver reseña',
                                  style: Const.medium.copyWith(
                                      fontSize: 13.sp, color: Const.kBlue)),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  widget.isShow
                      ? RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          glow: false,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                              Icons.star_rounded,
                              color: Const.kOrangeShade2),
                          onRatingUpdate: (rating) {},
                        )
                      : CustomButton(
                          onTap: () => Navigator.pushNamed(
                              arguments: true,
                              context,
                              AppRouter.qualifyScreen),
                          style: Const.buttonBorderStyle,
                          txtStyle: Const.medium.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          title: 'Calificar',
                        ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('El Tasker te calificó con:',
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w700)),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, AppRouter.myReputationScreen),
                        child: Text('Ver reseña',
                            style: Const.medium
                                .copyWith(fontSize: 13.sp, color: Const.kBlue)),
                      ),
                    ],
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    glow: false,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(Icons.star_rounded,
                        color: Const.kOrangeShade2),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            ListWidget(itemCount: 10),
            ListTile(
              title: Text('Ver tarea',
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700)),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: 20.h.w, color: Const.kBlackShade3),
            ),
            ListTile(
              onTap: widget.isShow
                  ? () => Navigator.pushNamed(
                      context, AppRouter.completionCodeScreen)
                  : null,
              title: Text('Código de Finalización',
                  style: Const.medium.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: widget.isShow ? Const.kBlack : Const.kBlackShade11,
                  )),
              trailing: widget.isShow
                  ? Row(
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
                    )
                  : const SizedBox(),
            ),
            ListTile(
              title: Text('Necesito Ayuda',
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700)),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: 20.h.w, color: Const.kBlackShade3),
            ),
            Divider(thickness: 20.h, color: Const.kScaffoldBackground),
          ],
        ),
      ),
    );
  }
}

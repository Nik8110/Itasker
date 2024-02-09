import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 260.h,
              child: Stack(
                children: [
                  Container(
                    color: Const.kBackground,
                    height: 180.h,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 40.h,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Const.kWhite,
                          ),
                        ),
                        SizedBox(width: 90.w),
                        Text(
                          'Mi perfil',
                          style: Const.medium.copyWith(
                            fontSize: 22.sp,
                            color: Const.kWhite,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 110.h,
                    left: 110.w,
                    child: CircleAvatar(
                      maxRadius: 70.r,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pedro Vasquez',
                    style: Const.bold
                        .copyWith(fontSize: 22.sp, color: Const.kBlack),
                  ),
                  SizedBox(height: 10.h),
                  RichWidget(
                    text: 'Miembro desde:',
                    style: Const.medium.copyWith(
                      fontSize: 15.sp,
                      color: Const.kBlackShade4,
                    ),
                    span: [
                      TextSpan(
                        text: ' 29 ene 2023',
                        style: Const.medium.copyWith(
                          fontSize: 15.sp,
                          color: Const.kBlackShade5,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Santiago Centro, Santiago, Chile',
                    style: Const.medium.copyWith(
                      fontSize: 15.sp,
                      color: Const.kBlackShade4,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Última conexión: hace 1 día',
                    style: Const.medium.copyWith(
                      fontSize: 15.sp,
                      color: Const.kBlackShade6,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.all(20.h.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobre mí',
                    style: Const.bold
                        .copyWith(fontSize: 22.sp, color: Const.kBlack),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adiping elit. Donec non leo a nisl iaculis gravida in eget ante. Ut sem ligula, ultrices ut interdum sit amet.',
                    style: Const.medium
                        .copyWith(fontSize: 16.sp, color: Const.kBlack),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Grupos de interés',
                    style: Const.bold
                        .copyWith(fontSize: 22.sp, color: Const.kBlack),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.h.w,
                        backgroundColor: Const.kYellowDark,
                      ),
                      SizedBox(width: 10.w),
                      CircleAvatar(
                        radius: 30.h.w,
                        backgroundColor: Const.kBlueLight,
                      ),
                      SizedBox(width: 10.w),
                      CircleAvatar(
                        radius: 30.h.w,
                        backgroundColor: Const.kYellowAccentLigth,
                      ),
                      SizedBox(width: 10.w),
                      CircleAvatar(
                        radius: 30.h.w,
                        backgroundColor: Const.kYellowDark,
                      ),
                      SizedBox(width: 10.w),
                      CircleAvatar(
                        radius: 30.h.w,
                        backgroundColor: Const.kBlueLight,
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  CustomButton(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRouter.myDatasScreen),
                    style: Const.buttonBorderStyle,
                    txtStyle: Const.medium.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    title: 'Editar Perfil',
                  ),
                ],
              ),
            ),
            const Divider(thickness: 7, color: Const.kDividerColor),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0.0, 20.w, 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () => Navigator.pushNamed(
                        context, AppRouter.myReputationScreen),
                    title: Text(
                      'Mi Reputación',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                    ),
                    contentPadding: EdgeInsets.zero,
                    trailing: const Icon(
                        size: 20,
                        Icons.arrow_forward_ios_rounded,
                        color: Const.kBlackShade3),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () => Navigator.pushNamed(
                        context,
                        arguments: false,
                        AppRouter.viewProfileAsUserScreen),
                    title: Text(
                      'Ver perfil como usuario',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                    ),
                    contentPadding: EdgeInsets.zero,
                    trailing: const Icon(
                      size: 20,
                      Icons.arrow_forward_ios_rounded,
                      color: Const.kBlackShade3,
                    ),
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

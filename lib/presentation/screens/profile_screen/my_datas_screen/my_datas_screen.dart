import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/gen/assets.gen.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/screens/profile_screen/my_datas_screen/my_datas_screen_widget.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

class MyDatasScreen extends StatefulWidget {
  const MyDatasScreen({super.key});

  @override
  State<MyDatasScreen> createState() => _MyDatasScreenState();
}

class _MyDatasScreenState extends State<MyDatasScreen> {
  TextEditingController txtController1 = TextEditingController();
  TextEditingController txtController2 = TextEditingController();
  TextEditingController txtController3 = TextEditingController();
  TextEditingController txtController4 = TextEditingController();

  String isSelectedDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      appBar: appBarWidget(context, title: 'Mis Datos'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Container(
              height: 180.h,
              width: double.infinity,
              padding: EdgeInsets.only(left: 110.w),
              child: Stack(
                children: [
                  Container(
                    height: 160.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Const.kWhite,
                      border: Border.all(width: 6.h.w, color: Const.kWhite),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6.0,
                          offset: const Offset(0, 3),
                          color: Const.kBlackShade2.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Assets.images.profile.image(height: 320.h),
                  ),
                  Positioned(
                    top: 110.h,
                    left: 110.w,
                    child: Container(
                      height: 55.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Const.kWhite,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6.0,
                            offset: const Offset(0, 3),
                            color: Const.kBlackShade2.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Assets.images.camera.image(height: 20.h),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.h.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre completo',
                    style: Const.medium.copyWith(fontSize: 13.sp),
                  ),
                  SizedBox(height: 5.h),
                  CustomTextFormField(
                    controller: txtController1,
                    hint: 'Pedro Vasquez',
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Correo Electrónico',
                    style: Const.medium.copyWith(fontSize: 13.sp),
                  ),
                  SizedBox(height: 5.h),
                  CustomTextFormField(
                    controller: txtController2,
                    hint: 'ejemplo@gmail.com',
                    fillColor: Const.kFillColor,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Fecha de nacimiento',
                    style: Const.medium.copyWith(fontSize: 13.sp),
                  ),
                  SizedBox(height: 5.h),
                  CustomTextFormField(
                    controller: txtController3,
                    hint: Strings.dateOfBirthHint,
                    width: 200.w,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: Const.kBackground,
                                  onPrimary: Const.kWhite,
                                  onSurface: Const.kBlack,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Const.kBackground),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2030));
                      if (pickedDate != null) {
                        setState(() {
                          txtController3.text =
                              '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                        });
                      }
                    },
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Descripción sobre mí',
                    style: Const.medium.copyWith(fontSize: 13.sp),
                  ),
                  SizedBox(height: 5.h),
                  CustomTextFormField(
                    controller: txtController4,
                    hint: 'Descripción sobre mí...',
                    maxLines: 10,
                    maxLength: 255,
                    topPadding: 30.h,
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                    onTap: () {},
                    style: Const.buttonBorderStyle,
                    txtStyle: Const.medium.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    title: 'Editar mis datos',
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
                        context, AppRouter.myInterestGroupScreen),
                    title: Text(
                      'Mis grupos de interés',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                    ),
                    contentPadding: EdgeInsets.zero,
                    trailing: const Icon(
                        size: 20,
                        Icons.arrow_forward_ios_rounded,
                        color: Const.kBlackShade3),
                  ),
                  ListTile(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, AppRouter.verifyYourIdentityScreen,
                        arguments: true),
                    title: Text(
                      'Editar Correo',
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

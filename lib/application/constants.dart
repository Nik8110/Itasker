// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:itasker/application/string.dart';

import '../gen/assets.gen.dart';
import '../presentation/shared_widget/custom_button.dart';

Map payloadObj = {};

class Const {
  /// Color
  static const Color kBackground = Color(0xFF93378E);
  static const Color kBlue = Color(0xFF0092FF);
  static const Color kBlueShad1 = Color(0xFFE4F3FF);
  static const Color kBlueShad2 = Color(0xFF0092FF);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kBlack = Color(0xFF000000);
  static const Color kBlackShade1 = Color(0xFF293645);
  static const Color kBlackShade2 = Color(0xFF636363);
  static const Color kBlackShade3 = Color(0xFFC6C5CA);
  static const Color kBlackShade4 = Color(0xFF707070);
  static const Color kBlackShade5 = Color(0xFF293645);
  static const Color kBlackShade6 = Color(0xFF8A98A5);
  static const Color kBlackShade7 = Color(0xFF6C757D);
  static const Color kBlackShade8 = Color(0xFFE1E1E1);
  static const Color kBlackShade9 = Color(0xFFA1A1A2);
  static const Color kBlackShade10 = Color(0xFF293645);
  static const Color kBlackShade11 = Color(0xFFC3C5C7);
  static const Color kBorder = Color(0xFF8A98A5);
  static const Color kProgressBorder = Color(0xFFF4F6F8);
  static const Color kBorderContainer = Color(0xFFE0E6EC);
  static const Color kBorderContainer2 = Color(0xFFE5E5E5);
  static const Color kContainerBorder3 = Color(0xFFF9C347);
  static const Color kContainerColor = Color(0xFFFFFEC3);
  static const Color kHint = Color(0xFFA1A1A2);
  static const Color kYellowDark = Color(0xFFFFD354);
  static const Color kYellowAccentLigth = Color(0xFFF4FF2E);
  static const Color kBlueLight = Color(0xFF64DDFF);
  static const Color kBoxShadow = Color(0xFF000029);
  static const Color kFillColor = Color(0xFFE0E6EC);
  static const Color kDividerColor = Color(0xFFF4F6F8);
  static const Color kDividerColor2 = Color(0xFFF0EFF5);
  static const Color kHintColor = Color(0xFF8A98A5);
  static const Color kGreenLight = Color(0xFF9BF55B);
  static const Color kPinkLight = Color(0xFFFF76CC);
  static const Color kindigoLight = Color(0xFF8792FF);
  static const Color kYellowLigth = Color(0xFFF7D074);
  static const Color kGreenAccentLigth = Color(0xFF5BDBD6);
  static const Color kYellowAccentDark = Color(0xFFFFC2A4);
  static const Color kScaffoldBackground = Color(0xFFF4F6F8);
  static const Color kYellowShade1 = Color(0xFFF1C200);
  static const Color kOrangeShade1 = Color(0xFFF19938);
  static const Color kOrangeShade2 = Color(0xFFF1C200);
  static const Color kBLueShade1 = Color(0xFF1555ED);
  static const Color kBLueShade2 = Color(0xFFE6F5FF);
  static const Color kBLueShade3 = Color(0xFF1E55EB);
  static const Color kRedShade1 = Color(0xFFE81820);
  static const Color kGreenShade1 = Color(0xFF25BB00);
  static const Color kGreenShade2 = Color(0xFF63C845);

// Padding
  static const double kPaddingS = 8.0;
  static const double kPaddingM = 16.0;
  static const double kPaddingL = 32.0;

// Spacing
  static const double kSpaceS = 8.0;
  static const double kSpaceM = 16.0;

  ///Bold
  static TextStyle bold = GoogleFonts.inter(
    color: Const.kBlack,
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
  );

  /// Medium
  static TextStyle medium = GoogleFonts.inter(
    color: Const.kBlack,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );

  ///Small
  static TextStyle small = GoogleFonts.inter(
    color: Const.kBlack,
    fontWeight: FontWeight.w200,
    fontSize: 12.sp,
  );

  static ButtonStyle get buttonBorderStyle {
    return ElevatedButton.styleFrom(
        backgroundColor: Const.kWhite,
        elevation: 0,
        padding: EdgeInsets.only(left: 10.w),
        fixedSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
            side: const BorderSide(color: Const.kBorderContainer)));
  }

  List<Map> listTask = [
    {
      "type": "Pendiente",
      "title": "Pasear a mi mascota",
      "color": Const.kYellowShade1
    },
    {
      "type": "En curso",
      "title": "Pasear a mi mascota",
      "color": Const.kBlueShad2
    },
    {
      "type": "Finalizadas",
      "title": "Pasear a mi mascota",
      "color": Const.kGreenShade1
    },
    {
      "type": "Canceladas",
      "title": "Pasear a mi mascota",
      "color": Const.kBlackShade10
    },
  ];

  static getPrice(int price) {
    final oCcy = NumberFormat('#,##0', 'DE');
    return oCcy.format(price);
  }
}

class RichWidget extends StatelessWidget {
  RichWidget({super.key, this.text, this.style, this.span});

  TextStyle? style;
  String? text;
  List<TextSpan>? span;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: text, style: style, children: span),
    );
  }
}

void showError(String error, context) {
  Get.snackbar(
    error,
    "",
    colorText: Const.kWhite,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Theme.of(context).colorScheme.error,
  );
}

void showMessage(String message, context) {
  Get.snackbar(
    message,
    "",
    colorText: Const.kWhite,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Const.kBackground,
  );
}

PreferredSizeWidget appBarWidget(BuildContext context,
    {String title = '',
    void Function()? onPressed,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Const.kBackground,
    elevation: 0,
    leading: IconButton(
      onPressed: onPressed ?? () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back_ios, color: iconColor ?? Const.kWhite),
    ),
    title: Text(
      title,
      style: Const.medium.copyWith(
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
        color: textColor ?? Const.kWhite,
      ),
    ),
    centerTitle: true,
  );
}

class ConWidget extends StatelessWidget {
  ConWidget({super.key, this.text});

  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.h,
      decoration: BoxDecoration(
        color: Const.kContainerColor,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: Const.kContainerBorder3),
      ),
      padding: EdgeInsets.fromLTRB(16.w, 13.h, 15.w, 18.h),
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Assets.svg.exclamationMark.svg(),
          SizedBox(width: 15.w),
          SizedBox(
              width: 258.w,
              child: Text(text!, style: Const.medium.copyWith(fontSize: 13.sp)))
        ],
      ),
    );
  }
}

Future confirmBottomWidget(
  BuildContext context, {
  String title = '',
  String desc = '',
  dynamic Function()? onTap,
  double height = 0.0,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.all(20.h.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title,
                    style: Const.medium.copyWith(
                        fontSize: 17.sp, fontWeight: FontWeight.w700)),
                const Spacer(),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close))
              ],
            ),
            SizedBox(height: 20.h),
            Text(desc,
                style: Const.medium
                    .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      txtStyle: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      style: Const.buttonBorderStyle,
                      title: Strings.no),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomButton(onTap: onTap, title: Strings.yes),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

class ListWidget extends StatelessWidget {
  ListWidget({super.key, required this.itemCount});

  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 10.h, color: Const.kScaffoldBackground),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              ListTile(
                title: Text('Categoría de la tarea',
                    style: Const.medium.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w700)),
                subtitle: Text('Tecnología',
                    style: Const.medium.copyWith(fontSize: 15.sp)),
                contentPadding: const EdgeInsets.all(0),
              ),
              ListTile(
                title: Text('Título de solicitud',
                    style: Const.medium.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w700)),
                subtitle: Text('Transcribir documento al español',
                    style: Const.medium.copyWith(fontSize: 15.sp)),
                contentPadding: const EdgeInsets.all(0),
              ),
              ListTile(
                title: Text('Fecha',
                    style: Const.medium.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w700)),
                subtitle: Text('Mar, 30 Ene - Después de las 20:00h',
                    overflow: TextOverflow.ellipsis,
                    style: Const.medium.copyWith(fontSize: 15.sp)),
                contentPadding: const EdgeInsets.all(0),
              ),
              ListTile(
                title: Text('Ubicación de referencia',
                    style: Const.medium.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w700)),
                subtitle: Text('Av. Dos de Mayo 1498, San Isidro 15073 ...',
                    overflow: TextOverflow.ellipsis,
                    style: Const.medium.copyWith(fontSize: 15.sp)),
                contentPadding: const EdgeInsets.all(0),
              ),
              ListTile(
                title: Text('Detalles de solicitud',
                    style: Const.medium.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w700)),
                subtitle: Text('Necesito que alguien pueda transcribirme ...',
                    overflow: TextOverflow.ellipsis,
                    style: Const.medium.copyWith(fontSize: 15.sp)),
                contentPadding: const EdgeInsets.all(0),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemCount,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(right: 10.w),
                    width: 100.h,
                    decoration: BoxDecoration(
                      color: Const.kBorderContainer,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text('Presupuesto',
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700)),
              Text('\$15.000',
                  style: Const.medium
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Divider(thickness: 10.h, color: Const.kScaffoldBackground),
      ],
    );
  }
}

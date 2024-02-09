import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../router/routes.dart';
import '../../../../shared_widget/custom_button.dart';
import '../../my_datas_screen/my_datas_screen_widget.dart';

class MyMercadoPagoAccountScreen extends StatelessWidget {
  MyMercadoPagoAccountScreen({super.key});

  TextEditingController txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: appBarWidget(context, title: 'Mi cuenta de Mercado Pago'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 13.h),
            Container(
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Const.kContainerColor,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: Const.kContainerBorder3),
              ),
              padding: EdgeInsets.fromLTRB(16.w, 13.h, 15.w, 18.h),
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              alignment: Alignment.topLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.svg.exclamationMark.svg(),
                  SizedBox(width: 15.w),
                  SizedBox(
                      width: 250.w,
                      child: Text(
                          'Revisar los datos de tu cuenta de Mercado Pago para recibir los depósitos de tu Saldo actual (total de las tareas finalizadas).',
                          style: Const.medium.copyWith(fontSize: 13.sp)))
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              elevation: 0,
              color: Const.kWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  side: const BorderSide(color: Const.kBorderContainer)),
              child: Padding(
                padding: EdgeInsets.all(20.h.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Correo de Mercado Pago',
                        style: Const.medium.copyWith(
                            fontSize: 22.sp, fontWeight: FontWeight.w700)),
                    SizedBox(height: 10.h),
                    RichWidget(
                        text:
                            'Para un depósito exitoso, es importante que tu cuenta de Mercado Pago tenga el mismo correo electrónico registrado que tu cuenta de iTasker. Si los correos electrónicos no coinciden, puedes modificarlo fácilmente en tus datos de iTasker. ',
                        style: Const.medium.copyWith(fontSize: 13.sp),
                        span: [
                          TextSpan(
                              text:
                                  'Asegurarte de que ambos correos sean iguales garantizará un proceso de transferencia sin problemas.',
                              style: Const.medium.copyWith(
                                  fontSize: 13.sp, color: Const.kRedShade1)),
                        ]),
                    SizedBox(height: 30.h),
                    Text(
                      'Correo Electrónico',
                      style: Const.medium.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 13.sp),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextFormField(
                      controller: txtEmail,
                      hint: 'ejemplo@gmail.com',
                      fillColor: Const.kBorderContainer,
                      hintColor: Const.kBlack,
                      borderColor: Const.kBlackShade8,
                    ),
                    SizedBox(height: 40.h),
                    CustomButton(
                        onTap: () => Navigator.pushNamed(
                            context, AppRouter.myDatasScreen),
                        title: 'Ir a mis Datos'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

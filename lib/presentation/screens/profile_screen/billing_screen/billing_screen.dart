import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

import '../../../../gen/assets.gen.dart';
import '../../../router/routes.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Const.kScaffoldBackground,
        appBar: appBarWidget(context, title: 'Facturación'),
        body: Padding(
            padding: EdgeInsets.only(left: 13.w, right: 13.w),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 13.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ConWidget(
                    text:
                        'Revisar los datos de tu cuenta de Mercado Pago para recibir los depósitos de tu Saldo actual (total de las tareas finalizadas).',
                  ),
                ),
                SizedBox(height: 10.h),
                Card(
                    elevation: 0,
                    color: Const.kWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      side: BorderSide(color: Const.kBorderContainer),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 16.w, right: 15.w, top: 20.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Mayo 2023',
                                        style: Const.medium.copyWith(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(height: 11.h),
                                    Text('Saldo actual',
                                        style: Const.medium.copyWith(
                                            fontSize: 13.sp,
                                            color: Const.kBlackShade4)),
                                    SizedBox(height: 5.h),
                                    Text('\$43.000',
                                        style: Const.bold
                                            .copyWith(fontSize: 30.sp)),
                                    SizedBox(height: 16.h),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width: 165.w,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Fecha de depósito',
                                                        style: Const.medium
                                                            .copyWith(
                                                                fontSize: 13.sp,
                                                                color: Const
                                                                    .kBlackShade4)),
                                                    SizedBox(height: 5.h),
                                                    Text('30 de Mayo',
                                                        style: Const.medium
                                                            .copyWith(
                                                                fontSize:
                                                                    17.sp))
                                                  ])),
                                          SizedBox(
                                              width: 140.w,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Comisión por uso',
                                                        style: Const.medium
                                                            .copyWith(
                                                                fontSize: 13.sp,
                                                                color: Const
                                                                    .kBlackShade4)),
                                                    SizedBox(height: 5.h),
                                                    Text('5%',
                                                        style: Const.medium
                                                            .copyWith(
                                                                fontSize:
                                                                    17.sp))
                                                  ]))
                                        ]),
                                    SizedBox(height: 15.h),
                                    RichWidget(
                                        text:
                                            'Recibirás el pago por las tareas realizadas en tu Saldo Actual. En cada Fecha de Depósito, recibirás el saldo disponible, menos la comisión por uso de iTasker, en la Cuenta de Mercado Pago que ingresaste. Mayor información en ',
                                        style: Const.medium
                                            .copyWith(fontSize: 13.sp),
                                        span: [
                                          TextSpan(
                                              text: 'Política de Pagos.',
                                              style: Const.medium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: Const.kBlue,
                                                  fontWeight: FontWeight.w700))
                                        ]),
                                    SizedBox(height: 20.h),
                                  ])),
                          const Divider(
                              color: Const.kDividerColor, thickness: 2),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.depositHistoryScreen),
                            child: Padding(
                              padding: EdgeInsets.all(15.h.w),
                              child: Row(
                                children: [
                                  Text('Historial de depósitos',
                                      style: Const.medium.copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600)),
                                  const Spacer(),
                                  const Icon(
                                      size: 20,
                                      Icons.arrow_forward_ios_rounded,
                                      color: Const.kBlackShade3),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                              color: Const.kDividerColor, thickness: 2),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.myMercadoPagoAccountScreen),
                            child: Padding(
                              padding: EdgeInsets.all(15.h.w),
                              child: Row(
                                children: [
                                  Text('Mi cuenta de Mercado Pago',
                                      style: Const.medium.copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600)),
                                  const Spacer(),
                                  const Icon(
                                      size: 20,
                                      Icons.arrow_forward_ios_rounded,
                                      color: Const.kBlackShade3),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h)
                        ])),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Historial de Ingresos',
                        style: Const.medium.copyWith(
                            fontSize: 22.sp, fontWeight: FontWeight.w700)),
                  ),
                ),
                SizedBox(height: 10.h),
                Card(
                    elevation: 0,
                    color: Const.kWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      side: BorderSide(color: Const.kBorderContainer),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text('Tarea #123',
                                style: Const.medium.copyWith(fontSize: 15.sp)),
                            subtitle: Text('25 Mayo',
                                style: Const.medium.copyWith(
                                    fontSize: 13.sp,
                                    color: Const.kBlackShade6)),
                            trailing: Text(
                              '+ \$5.000',
                              style: Const.medium.copyWith(
                                  fontSize: 17.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Divider(
                              color: Const.kDividerColor, thickness: 2),
                          ListTile(
                            title: Text('Tarea #122',
                                style: Const.medium.copyWith(fontSize: 15.sp)),
                            subtitle: Text('16 Mayo',
                                style: Const.medium.copyWith(
                                    fontSize: 13.sp,
                                    color: Const.kBlackShade6)),
                            trailing: Text(
                              '+ \$5.000',
                              style: Const.medium.copyWith(
                                  fontSize: 17.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Divider(
                              color: Const.kDividerColor, thickness: 2),
                          ListTile(
                            title: Text('Tarea #122',
                                style: Const.medium.copyWith(fontSize: 15.sp)),
                            subtitle: Text('29 Abril',
                                style: Const.medium.copyWith(
                                    fontSize: 13.sp,
                                    color: Const.kBlackShade6)),
                            trailing: Text(
                              '+ \$5.000',
                              style: Const.medium.copyWith(
                                  fontSize: 17.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ])),
                SizedBox(height: 50.h)
              ]),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

import '../../../gen/assets.gen.dart';

class CompletionCodeScreen extends StatelessWidget {
  const CompletionCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, title: 'Código de Finalización'),
      body: Padding(
        padding: EdgeInsets.all(20.h.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text('Envía el Código al Tasker',
                  style: Const.medium
                      .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
            ),
            Text('¡Cuando haya finalizado tu tarea satisfactoriamente!',
                textAlign: TextAlign.center,
                style: Const.medium.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: Const.kRedShade1)),
            SizedBox(height: 20.h),
            Text(
                'Solo enviar este Código de Finalización al Tasker cuando hayas verificado que la tarea ha sido completada satisfactoriamente. Así confirmas que la tarea ha sido exitosamente finalizada y el Tasker podrá recibir el pago por el servicio que brindó.',
                style: Const.medium.copyWith(fontSize: 15.sp)),
            SizedBox(height: 30.h),
            Text('El código de finalización es:',
                style: Const.medium
                    .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600)),
            SizedBox(height: 5.h),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    bottomLeft: Radius.circular(5.r),
                  ),
                  child: Container(
                    height: 56.h,
                    width: 200.w,
                    decoration: const BoxDecoration(
                      color: Const.kScaffoldBackground,
                      border: Border(
                        left: BorderSide(
                            color: Const.kBorderContainer, width: 1.5),
                        top: BorderSide(
                            color: Const.kBorderContainer, width: 1.5),
                        bottom: BorderSide(
                            color: Const.kBorderContainer, width: 1.5),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text('1Z4A',
                        style: Const.medium.copyWith(
                            fontSize: 22.sp, fontWeight: FontWeight.w700)),
                  ),
                ),
                Container(
                  height: 56.h,
                  width: 110.w,
                  decoration: BoxDecoration(
                    color: Const.kBackground,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.r),
                      bottomRight: Radius.circular(5.r),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Copiar',
                          style: Const.medium
                              .copyWith(fontSize: 17.sp, color: Const.kWhite)),
                      SizedBox(width: 8.w),
                      const Icon(
                        Icons.copy,
                        color: Const.kWhite,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Container(
              decoration: BoxDecoration(
                  color: Const.kBLueShade2,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: Const.kBLueShade3)),
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(16.w, 13.h, 18.w, 18.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.svg.questionMark.svg(),
                  SizedBox(width: 16.w),
                  Flexible(
                    child: Text(
                        'El pago solo se liberará cuando confirmes que la tarea ha sido realizada a tu satisfacción ¡Gracias por usar iTasker!',
                        style: Const.medium.copyWith(fontSize: 13.sp)),
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

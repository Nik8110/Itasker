import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/gen/assets.gen.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../../application/constants.dart';
import '../../router/routes.dart';

class FinishTaskScreen extends StatelessWidget {
  const FinishTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context,
          iconColor: Const.kBlack, backgroundColor: Const.kWhite),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.h.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.done.image(height: 80.h, width: 80.w),
              SizedBox(height: 20.h),
              Text('¿Finalizaste la Tarea?',
                  style: Const.bold.copyWith(fontSize: 30.sp)),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Text(
                    'Si estás seguro que finalizaste la tarea te damos algunas indicaciones para ayudarte a finalizar la tarea exitosamente:',
                    textAlign: TextAlign.center,
                    style: Const.medium.copyWith(fontSize: 15.sp)),
              ),
              SizedBox(height: 30.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.svg.tick.svg(),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: RichWidget(
                      text: 'Solicita el Código de Finalización al Ofertante: ',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                      span: [
                        TextSpan(
                          text:
                              'Al presionar "Estoy seguro" te solicitaremos el código de finalización de la tarea que solo el Ofertante posee.',
                          style: Const.medium.copyWith(fontSize: 15.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.svg.tick.svg(),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: RichWidget(
                      text: 'Se liberará el presupuesto de la tarea: ',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                      span: [
                        TextSpan(
                          text:
                              'El presupuesto acordado por el servicio se liberará e ingresará a tu Saldo en "Facturación" en "Mi cuenta".',
                          style: Const.medium.copyWith(fontSize: 15.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.svg.tick.svg(),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: RichWidget(
                      text: 'Califica al Ofertante:',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                      span: [
                        TextSpan(
                          text:
                              'Podrás calificar al ofertante por tu experiencia como Tasker en su tarea ofertada.',
                          style: Const.medium.copyWith(fontSize: 15.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              ConWidget(
                  text:
                      'SOLO si estás seguro de finalizar la tarea presiona "Estoy Seguro", de lo contrario retrocede hasta acordar con el ofertante.'),
              SizedBox(height: 30.h),
              CustomButton(
                  onTap: () => Navigator.pushNamed(
                      context, AppRouter.finishHomeWorkScreen),
                  title: 'Estoy seguro'),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

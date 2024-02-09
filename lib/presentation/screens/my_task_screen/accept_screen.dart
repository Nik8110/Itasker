import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../../gen/assets.gen.dart';
import '../../router/routes.dart';

class AcceptScreen extends StatelessWidget {
  const AcceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      appBar: appBarWidget(context,
          backgroundColor: Const.kWhite, iconColor: Const.kBlack),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            Text('Deposita y chatea con el Tasker',
                textAlign: TextAlign.center,
                style: Const.bold.copyWith(fontSize: 30.sp)),
            SizedBox(height: 50.h),
            CircleAvatar(
              radius: 50.r,
              backgroundColor: Const.kScaffoldBackground,
              child: Assets.images.chat.image(height: 60.h, width: 60.w),
            ),
            SizedBox(height: 20.h),
            Text(
                'Deposita el presupuesto seleccionado y empieza a chatear con el Tasker para tu tarea.',
                textAlign: TextAlign.center,
                style: Const.medium
                    .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600)),
            SizedBox(height: 50.h),
            CircleAvatar(
              radius: 50.r,
              backgroundColor: Const.kScaffoldBackground,
              child: Assets.images.creditCard.image(height: 60.h, width: 60.w),
            ),
            SizedBox(height: 20.h),
            Text(
                '¡Descuida, guardaremos el presupuesto que deposites hasta que confirmes exitosamente la finalización de tu tarea!',
                textAlign: TextAlign.center,
                style: Const.medium
                    .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600)),
            const Spacer(),
            CustomButton(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.checkOutScreen),
                title: 'Continuar'),
            SizedBox(height: 20.h)
          ],
        ),
      ),
    );
  }
}

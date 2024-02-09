import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../router/routes.dart';
import '../auth_screen/widget/custom_textfield.dart';

class FinishHomeWorkScreen extends StatelessWidget {
  FinishHomeWorkScreen({super.key});

  TextEditingController txtCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, title: 'Finalizar tarea'),
      body: Padding(
        padding: EdgeInsets.all(20.h.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('¡Solicita el Código de Finalización al Ofertante!',
                textAlign: TextAlign.center,
                style: Const.medium
                    .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
            SizedBox(height: 20.h),
            Text(
                'El Ofertante te brindará el código de finalización por la tarea que realizaste. Si el ofertante no lo encuentra, puedes guiarlo: Se encuentra en la lista de opciones de su Tarea, con título "Código de Finalización".',
                style: Const.medium.copyWith(fontSize: 15.sp)),
            SizedBox(height: 30.h),
            Text('Ingresar código',
                style: Const.medium.copyWith(fontSize: 15.sp)),
            SizedBox(height: 5.h),
            CustomTextField(controller: txtCode, hint: 'Ingresar código'),
            SizedBox(height: 30.h),
            CustomButton(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.successScreen5),
                title: 'Finalizar'),
            SizedBox(height: 150.h),
            ConWidget(
                text:
                    'Si el ofertante no provee el código de finalización pide nuestra ayuda en el botón "Necesito Ayuda".'),
            SizedBox(height: 20.h),
            CustomButton(
              onTap: () {},
              style: Const.buttonBorderStyle,
              txtStyle: Const.medium
                  .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700),
              title: 'Necesito Ayuda',
            ),
          ],
        ),
      ),
    );
  }
}

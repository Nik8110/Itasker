import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/gen/assets.gen.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../../application/constants.dart';
import '../../router/routes.dart';
import '../list_screen/list_screen_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isChecked = false;

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
              Assets.images.homework.image(height: 80.h, width: 80.w),
              SizedBox(height: 26.h),
              Text('Crea tareas en iTasker',
                  textAlign: TextAlign.center,
                  style: Const.bold.copyWith(fontSize: 30.sp)),
              SizedBox(height: 26.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Text(
                    'Crear tareas es rápido y fácil. Aquí tienes unos tips que te ayudarán:',
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
                      text: 'Sé claro y conciso al describir la tarea: ',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                      span: [
                        TextSpan(
                          text:
                              'Describe la tarea clara y concisamente para que los Taskers entiendan lo que buscas.',
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
                      text: 'Establece un presupuesto justo: ',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                      span: [
                        TextSpan(
                          text:
                              'Establecer un presupuesto justo y realista, así obtendrás ofertas de Taskers ideales y no pagarás más de lo necesario.',
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
                      text: 'Elige Taskers confiables: ',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                      span: [
                        TextSpan(
                          text:
                              'Antes de elegir un Tasker, revisa su perfil, calificaciones y reseñas para asegurarte que sea confiable y adecuado para tu tarea.',
                          style: Const.medium.copyWith(fontSize: 15.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              CheckBoxWidget(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
                title: 'No volver a mostrar este mensaje',
              ),
              SizedBox(height: 30.h),
              CustomButton(
                  onTap: () => Navigator.pushNamed(
                      context, AppRouter.chooseTaskCategoriesScreen,
                      arguments: false),
                  title: 'Entiendo'),
            ],
          ),
        ),
      ),
    );
  }
}

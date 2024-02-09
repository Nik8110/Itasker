import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/router/routes.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBarWidget(context),
              SizedBox(height: 20.h),
              Text('Tarea #123',
                  style: Const.medium
                      .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
              SizedBox(height: 10.h),
              Container(
                  width: 95.w,
                  height: 35.h,
                  padding: EdgeInsets.all(8.h.w),
                  decoration: BoxDecoration(
                      color: Const.kOrangeShade1.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(19.r)),
                  alignment: Alignment.center,
                  child: Text('Aplicando',
                      style: Const.medium.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Const.kOrangeShade1))),
              SizedBox(height: 13.h),
              Text('11/03/2022 - 10:00 hrs.',
                  style: Const.medium.copyWith(fontSize: 15.sp)),
              SizedBox(height: 20.h),
              Divider(thickness: 10.h, color: Const.kScaffoldBackground),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.h.w),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Categoría de la tarea',
                              style: Const.medium.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700)),
                          subtitle: Text('Tecnología',
                              style: Const.medium.copyWith(fontSize: 15.sp)),
                          contentPadding: const EdgeInsets.all(0),
                        ),
                        ListTile(
                          title: Text('Título de solicitud',
                              style: Const.medium.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700)),
                          subtitle: Text('Transcribir documento al español',
                              style: Const.medium.copyWith(fontSize: 15.sp)),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded,
                              color: Const.kBlackShade3),
                          contentPadding: const EdgeInsets.all(0),
                        ),
                        ListTile(
                          title: Text('Fecha',
                              style: Const.medium.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700)),
                          subtitle: Text('Mar, 30 Ene - Después de las 20:00h',
                              overflow: TextOverflow.ellipsis,
                              style: Const.medium.copyWith(fontSize: 15.sp)),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded,
                              color: Const.kBlackShade3),
                          contentPadding: const EdgeInsets.all(0),
                        ),
                        ListTile(
                          title: Text('Ubicación de referencia',
                              style: Const.medium.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700)),
                          subtitle: Text(
                              'Av. Dos de Mayo 1498, San Isidro 15073 ...',
                              overflow: TextOverflow.ellipsis,
                              style: Const.medium.copyWith(fontSize: 15.sp)),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded,
                              color: Const.kBlackShade3),
                          contentPadding: const EdgeInsets.all(0),
                        ),
                        ListTile(
                          title: Text('Detalles de solicitud',
                              style: Const.medium.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700)),
                          subtitle: Text(
                              'Necesito que alguien pueda transcribirme ...',
                              overflow: TextOverflow.ellipsis,
                              style: Const.medium.copyWith(fontSize: 15.sp)),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded,
                              color: Const.kBlackShade3),
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
                            itemCount: 5,
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
                            style: Const.medium.copyWith(
                                fontSize: 15.sp, fontWeight: FontWeight.w700)),
                        Text('\$15.000',
                            style: Const.medium.copyWith(
                                fontSize: 15.sp, fontWeight: FontWeight.w500)),
                        SizedBox(height: 15.h),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 10.h,
                color: Const.kScaffoldBackground,
              ),
              Padding(
                padding: EdgeInsets.all(20.h.w),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, AppRouter.offerAndCounterOfferScreen),
                      title: Text('Ofertas y contraofertas',
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w500)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 13.h.w,
                            backgroundColor: Const.kBlue,
                            child: Text('3',
                                style: Const.medium.copyWith(
                                    fontSize: 13.sp,
                                    color: Const.kWhite,
                                    fontWeight: FontWeight.w700)),
                          ),
                          SizedBox(width: 12.w),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              color: Const.kBlackShade3),
                        ],
                      ),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, AppRouter.questionAnswerScreen),
                      title: Text('Preguntas y respuestas',
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w500)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 13.h.w,
                            backgroundColor: Const.kBlue,
                            child: Text('2',
                                style: Const.medium.copyWith(
                                    fontSize: 13.sp,
                                    color: Const.kWhite,
                                    fontWeight: FontWeight.w700)),
                          ),
                          SizedBox(width: 12.w),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              color: Const.kBlackShade3),
                        ],
                      ),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    ListTile(
                      onTap: () => Navigator.pushNamed(
                          arguments: {'text': 'Preguntar', 'isShow': false},
                          context,
                          AppRouter.offerorChatBudgetScreen),
                      title: Text('Ver tarea',
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          color: Const.kBlackShade3),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    ListTile(
                      title: Text('Necesito Ayuda',
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          color: Const.kBlackShade3),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, AppRouter.cancleTaskScreen);
                      },
                      title: Text('Cancelar tarea',
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          color: Const.kBlackShade3),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

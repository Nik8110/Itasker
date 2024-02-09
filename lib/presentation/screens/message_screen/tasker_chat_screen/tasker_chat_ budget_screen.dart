import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

import '../../../../gen/assets.gen.dart';
import '../../../router/routes.dart';
import '../../../shared_widget/custom_button.dart';
import '../../profile_screen/my_datas_screen/my_datas_screen_widget.dart';

class TaskerChatBudgetScreen extends StatefulWidget {
  final String buttonText;
  final bool isShow;
  final bool isCommentShow;

  const TaskerChatBudgetScreen(
      {super.key,
      required this.buttonText,
      this.isShow = false,
      this.isCommentShow = true});

  @override
  State<TaskerChatBudgetScreen> createState() => _TaskerChatBudgetScreenState();
}

class _TaskerChatBudgetScreenState extends State<TaskerChatBudgetScreen> {
  TextEditingController txtQuestion = TextEditingController();
  bool isComment = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      appBar: appBarWidget(context,
          title: 'Presupuesto: \$15.000',
          backgroundColor: Const.kWhite,
          textColor: Const.kBlack,
          iconColor: Const.kBlack),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Divider(color: Const.kScaffoldBackground, thickness: 10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Container(
                            height: 50.h,
                            width: 50.w,
                            margin: EdgeInsets.only(top: 5.h),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Const.kBlueLight,
                            ),
                            child: Assets.images.animals.image(scale: 3),
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15.h),
                              Text(
                                'Paula S. solicita',
                                style: Const.medium.copyWith(fontSize: 13.sp),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'Pasear a mi mascota',
                                style: Const.medium.copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'Hoy, 07:51 PM',
                                style: Const.medium.copyWith(fontSize: 13.sp),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Detalles',
                          style: Const.medium.copyWith(
                              fontSize: 17.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adiping elit. Donec non leo a nisl iaculis gravida in eget ante. Ut sem ligula, ultrices ut interdum sit amet.',
                            style: Const.medium.copyWith(
                                fontSize: 15.sp, color: Const.kBlackShade5),
                          ),
                        ),
                        SizedBox(height: 20.h),
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
                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsets.all(15.h.w),
                          margin: EdgeInsets.only(right: 20.w),
                          decoration: BoxDecoration(
                              color: Const.kScaffoldBackground,
                              borderRadius: BorderRadius.circular(8.r),
                              border:
                                  Border.all(color: Const.kBorderContainer)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.location_on_outlined,
                                      color: Const.kBackground),
                                  SizedBox(width: 10.w),
                                  Flexible(
                                    child: Text(
                                      'Santiago Centro, Santiago, Chile',
                                      style: Const.medium
                                          .copyWith(fontSize: 15.sp),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today,
                                      color: Const.kBackground),
                                  SizedBox(width: 10.w),
                                  Flexible(
                                    child: Text(
                                      'Fecha solicitada: 15 de Enero',
                                      style: Const.medium
                                          .copyWith(fontSize: 15.sp),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  const Icon(Icons.schedule,
                                      color: Const.kBackground),
                                  SizedBox(width: 10.w),
                                  Flexible(
                                    child: Text(
                                      'Horario de tarea: Antes de las 12:00h',
                                      style: Const.medium
                                          .copyWith(fontSize: 15.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: widget.isShow ? 20.h : 0),
                        widget.isShow
                            ? Container(
                                padding: EdgeInsets.all(15.h.w),
                                margin: EdgeInsets.only(right: 20.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  border:
                                      Border.all(color: Const.kBorderContainer),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Tu oferta: \$15.300',
                                      style: Const.medium.copyWith(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        confirmBottomWidget(
                                          context,
                                          height: 230.h,
                                          title: 'Estás seguro de retirar?',
                                          desc:
                                              'Si retiras tu oferta, el ofertante no podrá visualizar tu oferta y no podrás volver a ofertar en esta tarea.',
                                          onTap: () => Navigator.pop(context),
                                        );
                                      },
                                      child: CircleAvatar(
                                        radius: 16.r,
                                        backgroundColor: Const.kBorderContainer,
                                        child: Icon(Icons.close,
                                            size: 18.h.w, color: Const.kBlack),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Divider(color: Const.kScaffoldBackground, thickness: 10.h),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Sobre ofertante',
                                style: Const.medium.copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700)),
                            const Spacer(),
                            TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, AppRouter.viewProfileAsUserScreen,
                                  arguments: true),
                              child: Text(
                                'Ver Perfil',
                                style: Const.medium.copyWith(
                                  fontSize: 13.sp,
                                  color: Const.kBlueShad2,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        ListTile(
                          leading: Container(
                            height: 55.h,
                            width: 55.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Const.kBackground,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Paula S.',
                                style: Const.medium.copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  Text(
                                    '5.0',
                                    style: Const.medium.copyWith(
                                        fontSize: 15.sp,
                                        color: Const.kYellowShade1,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(width: 5.w),
                                  const Icon(Icons.star,
                                      color: Const.kYellowShade1),
                                  SizedBox(width: 5.w),
                                  Flexible(
                                    child: Text(
                                      '(4) | Miembro desde 2023',
                                      style: Const.medium.copyWith(
                                          fontSize: 15.sp,
                                          color: Const.kBlackShade6),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'Santiago Centro, Santiago, Chile',
                                style: Const.medium.copyWith(
                                    fontSize: 13.sp, color: Const.kBlackShade5),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Divider(color: Const.kScaffoldBackground, thickness: 10.h),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Preguntas y respuestas',
                            style: Const.medium.copyWith(
                                fontSize: 17.sp, fontWeight: FontWeight.w700)),
                        Column(
                          children: List.generate(
                            2,
                            (index) => Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 45.h,
                                    width: 45.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Const.kBackground,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(0),
                                  title: Text(
                                    'Carla G.',
                                    style: Const.medium.copyWith(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: RichWidget(
                                    text: 'Miembro nuevo',
                                    style: Const.medium.copyWith(
                                        fontSize: 13.sp,
                                        color: Const.kBlackShade5),
                                    span: [
                                      TextSpan(
                                        text: ' | Hoy, 04:00 PM',
                                        style: Const.medium.copyWith(
                                            fontSize: 13.sp,
                                            color: Const.kBlackShade6),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  '¿Lorem ipsum dolor sit amet, consetetur adiping elit. Donec non leo a nisl?',
                                  style: Const.medium.copyWith(
                                      fontSize: 16.sp,
                                      color: Const.kBlackShade5),
                                ),
                                SizedBox(height: 20.h),
                                Column(
                                    children: List.generate(
                                        2,
                                        (index) => Container(
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      left: BorderSide(
                                                          color:
                                                              Const.kBackground,
                                                          width: 2))),
                                              margin: EdgeInsets.only(
                                                  left: 20.w,
                                                  top: 10.h,
                                                  bottom: 10.h),
                                              padding:
                                                  EdgeInsets.only(left: 20.w),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    leading: Container(
                                                        height: 45.h,
                                                        width: 45.w,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Const
                                                                    .kBackground
                                                                    .withOpacity(
                                                                        0.2))),
                                                    contentPadding:
                                                        const EdgeInsets.all(0),
                                                    title: Text('Paula S.',
                                                        style: Const.medium
                                                            .copyWith(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                    subtitle: RichWidget(
                                                        text: 'Miembro nuevo',
                                                        style: Const.medium
                                                            .copyWith(
                                                                fontSize: 13.sp,
                                                                color: Const
                                                                    .kBlackShade5),
                                                        span: [
                                                          TextSpan(
                                                              text:
                                                                  ' | Hoy, 04:00 PM',
                                                              style: Const
                                                                  .medium
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13.sp,
                                                                      color: Const
                                                                          .kBlackShade6))
                                                        ]),
                                                  ),
                                                  Text(
                                                      '¿Lorem ipsum dolor sit amet, consetetur adiping elit. Donec non leo a nisl?',
                                                      style: Const.medium
                                                          .copyWith(
                                                              fontSize: 16.sp,
                                                              color: Const
                                                                  .kBlackShade5))
                                                ],
                                              ),
                                            )))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        if (widget.isCommentShow)
                          Text('Pregúntale a Paula S.',
                              style: Const.medium.copyWith(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700)),
                        if (widget.isCommentShow) SizedBox(height: 5.h),
                        if (widget.isCommentShow)
                          CustomTextFormField(
                            controller: txtQuestion,
                            hint: 'Escribe tu pregunta...',
                            maxLines: 5,
                            topPadding: 30.h,
                          ),
                        SizedBox(height: 10.h),
                        if (widget.isCommentShow)
                          CustomButton(
                            onTap: () {},
                            style: Const.buttonBorderStyle,
                            txtStyle: Const.medium.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            title: widget.buttonText,
                          ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          widget.isShow
              ? const SizedBox()
              : Padding(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                  child: CustomButton(
                    onTap: () => Navigator.pushNamed(
                        context, AppRouter.applyToTaskScreen),
                    title: 'Aplicar',
                  ),
                ),
        ],
      ),
    );
  }
}

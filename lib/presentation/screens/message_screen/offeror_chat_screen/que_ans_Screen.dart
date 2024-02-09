import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../profile_screen/my_datas_screen/my_datas_screen_widget.dart';

class QuestionAnswerScreen extends StatefulWidget {
  const QuestionAnswerScreen({super.key});

  @override
  State<QuestionAnswerScreen> createState() => _QuestionAnswerScreenState();
}

class _QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  TextEditingController txtAnswer = TextEditingController();

  bool isShow = false;
  int indexs = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, title: 'Preguntas y respuestas'),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.all(10.h.w),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Const.kBackground.withOpacity(0.2))),
                  contentPadding: const EdgeInsets.all(0),
                  title: Row(
                    children: [
                      Text('Fernando S.',
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, AppRouter.viewProfileAsUserScreen,
                            arguments: false),
                        child: Text(
                          'Ver Perfil',
                          style: Const.medium.copyWith(
                            fontSize: 13.sp,
                            color: Const.kBlueShad2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: RichWidget(
                      text: 'Miembro nuevo',
                      style: Const.medium
                          .copyWith(fontSize: 13.sp, color: Const.kBlackShade5),
                      span: [
                        TextSpan(
                            text: ' | Hoy, 04:00 PM',
                            style: Const.medium.copyWith(
                                fontSize: 13.sp, color: Const.kBlackShade6))
                      ]),
                ),
                Text(
                    '¿Lorem ipsum dolor sit amet, consetetur adiping elit. Donec non leo a nisl?',
                    style: Const.medium.copyWith(fontSize: 13.sp)),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isShow == false || indexs != index
                          ? 'Tu respuesta'
                          : 'Escribe tu respuesta',
                      style: Const.medium.copyWith(
                          fontSize: 13.sp, fontWeight: FontWeight.w600),
                    ),
                    isShow == false || indexs != index
                        ? GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => SizedBox(
                                  height: 150.h,
                                  child: Padding(
                                    padding: EdgeInsets.all(20.h.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Opciones de respuesta',
                                              style: Const.medium.copyWith(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: const Icon(Icons.close))
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        ListTile(
                                          onTap: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              isShow = !isShow;
                                              indexs = index;
                                            });
                                          },
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                          title: Text('Editar',
                                              style: Const.medium.copyWith(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Icon(Icons.more_horiz_rounded, size: 30.h.w))
                        : const SizedBox()
                  ],
                ),
                SizedBox(height: 5.h),
                isShow && indexs == index
                    ? CustomTextFormField(
                        controller: txtAnswer,
                        hint: 'Escribir respuesta',
                        maxLines: 5,
                        maxLength: 255,
                        topPadding: 30.h,
                      )
                    : Text(
                        'Proin congue dolor at eros tempor congue. Sed est augue, egestas in purus id, dictum malesuada sapien. Donec imperdiet ex nibh, efficitur imperdiet elit pellentesque sed.',
                        style: Const.medium.copyWith(
                            fontSize: 13.sp, color: Const.kBlackShade5),
                      ),
                SizedBox(height: 5.h),
                isShow && indexs == index
                    ? CustomButton(
                        onTap: () {
                          setState(() {
                            isShow = false;
                          });
                        },
                        title: "Responder")
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

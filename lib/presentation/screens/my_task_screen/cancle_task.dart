import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../shared_widget/custom_radio_bution.dart';

class CancleTaskScreen extends StatefulWidget {
  CancleTaskScreen({super.key});

  @override
  State<CancleTaskScreen> createState() => _CancleTaskScreenState();
}

class _CancleTaskScreenState extends State<CancleTaskScreen> {
  String groupValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: appBarWidget(
        context,
        title: 'Cancelar mi tarea',
        backgroundColor: Const.kWhite,
        iconColor: Const.kBlack,
        textColor: Const.kBlack,
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20.h.w),
              color: Const.kWhite,
              child: Column(
                children: [
                  Text('¿Porqué desea cancelar tu tarea?',
                      style: Const.medium.copyWith(
                          fontSize: 22.sp, fontWeight: FontWeight.w700)),
                  SizedBox(height: 20.h),
                  MyRadioListTile(
                      title: 'Ya no necesito ayuda',
                      value: 'Ya no necesito ayuda',
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value.toString();
                        });
                      }),
                  MyRadioListTile(
                      title: 'Nadie ofertó mi tarea',
                      value: 'Nadie ofertó mi tarea',
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value.toString();
                        });
                      }),
                  MyRadioListTile(
                      title: 'Alguien ya solucionó mi necesidad',
                      value: 'Alguien ya solucionó mi necesidad',
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value.toString();
                        });
                      }),
                  MyRadioListTile(
                      title: 'Agendaré para el futuro',
                      value: 'Agendaré para el futuro',
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value.toString();
                        });
                      }),
                ],
              )),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(20.h.w),
            child: CustomButton(
                onTap: () => Navigator.pop(context), title: 'Confirmar'),
          ),
        ],
      ),
    );
  }
}

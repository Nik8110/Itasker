import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:itasker/presentation/router/routes.dart';

import '../../../application/constants.dart';
import '../../../application/string.dart';
import '../../shared_widget/custom_button.dart';
import '../../shared_widget/custom_radio_bution.dart';
import '../../shared_widget/date_picker/src/date_picker.dart';
import '../../shared_widget/date_picker/src/date_picker_theme.dart';
import '../../shared_widget/date_picker/src/i18n/date_picker_i18n.dart';
import '../list_screen/list_screen_widget.dart';

class CategoryBoarding2Screen extends StatefulWidget {
  const CategoryBoarding2Screen(
      {super.key,
      required this.pageController,
      this.isSummary = false,
      required this.selectedInd});
  final PageController pageController;
  final int selectedInd;
  final bool isSummary;

  @override
  State<CategoryBoarding2Screen> createState() =>
      _CategoryBoarding2ScreenState();
}

class _CategoryBoarding2ScreenState extends State<CategoryBoarding2Screen> {
  bool isChecked = false;
  String groupValue = '';
  String selectedModule = '';
  bool isDateSelected = false;
  DateTime? selectedDate;
  String? selectedDateTime;

  void selectDate(DateTime dateTime) {
    if (dateTime.month.toString() == '1') {
      selectedDateTime = 'Enero ${dateTime.day.toString()}';
    } else if (dateTime.month.toString() == '2') {
      selectedDateTime = 'Febrero ${dateTime.day.toString()}';
    } else if (dateTime.month.toString() == '3') {
      selectedDateTime = 'Marzo ${dateTime.day.toString()}';
    } else if (dateTime.month.toString() == '4') {
      selectedDateTime = 'Abril ${dateTime.day.toString()}';
    } else if (dateTime.month.toString() == '5') {
      selectedDateTime = 'Puede ${dateTime.day.toString()}';
    } else if (dateTime.month.toString() == '6') {
      selectedDateTime = 'Junio ${dateTime.day.toString()}';
    } else if (dateTime.month.toString() == '7') {
      selectedDateTime = 'Julio ${dateTime.day.toString()}';
    } else if (dateTime.month.toString() == '8') {
      selectedDateTime = 'Agosto ${dateTime.day.toString()}';
    } else if (dateTime.month.toString() == '9') {
      selectedDateTime = 'Septiembre ${dateTime.day.toString()}';
    } else if (dateTime.month.toString() == '10') {
      selectedDateTime = 'Octubre ${dateTime.day.toString()}';
    } else if (dateTime.month.toString() == '11') {
      selectedDateTime = 'Noviembre ${dateTime.day.toString()}';
    } else if (dateTime.month.toString() == '12') {
      selectedDateTime = 'Diciembre ${dateTime.day.toString()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Const.kWhite,
          padding: EdgeInsets.all(20.h.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('¿Para cuándo lo necesitas?',
                  style: Const.bold.copyWith(fontSize: 30.sp)),
              SizedBox(height: 15.h),
              Text('Elige una fecha o plaza para realizar tu tarea',
                  style: Const.medium.copyWith(fontSize: 15.sp)),
              SizedBox(height: 20.h),
              Text('Fecha o plaza',
                  style: Const.medium
                      .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      height: 280.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                              onTap: () {
                                setState(() {
                                  isDateSelected = false;

                                  selectedModule = 'Lo antes posible';
                                });
                                Navigator.pop(context);
                              },
                              title: Text('Lo antes posible',
                                  style: Const.medium.copyWith(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700)),
                              subtitle: Text(
                                  'Publicará tu tarea con "Lo antes posible".',
                                  style:
                                      Const.medium.copyWith(fontSize: 15.sp))),
                          Divider(
                              color: Const.kDividerColor2, thickness: 1.5.h),
                          ListTile(
                              onTap: () {
                                selectedModule = "";
                                Navigator.pop(context);
                                DatePicker.showDatePicker(context,
                                    // maxDateTime: ,

                                    onCancel: () {
                                      selectedDateTime ??
                                          selectDate(DateTime.now());
                                    },
                                    initialDateTime: DateTime.now(),
                                    locale: DateTimePickerLocale.es,
                                    pickerTheme: DateTimePickerTheme(
                                        pickerHeight:
                                            MediaQuery.of(context).size.height *
                                                0.4),
                                    pickerMode: DateTimePickerMode.date,
                                    onConfirm: (dateTime, selectedIndex) {
                                      setState(() {
                                        isDateSelected = true;
                                        selectedDate = dateTime;
                                      });
                                      Navigator.pop(context);
                                    },
                                    onButtonPressed: () {
                                      setState(() {
                                        isDateSelected = true;
                                      });
                                      Navigator.pop(context);
                                    },
                                    onChange: (dateTime, selectedIndex) {
                                      log(dateTime.toString());
                                      selectDate(dateTime);

                                      setState(() {
                                        isDateSelected = true;
                                        selectedDate = dateTime;
                                      });
                                    },
                                    onClose: () {},
                                    dateFormat: 'MMMM dd');
                              },
                              title: Text('Para una fecha puntual',
                                  style: Const.medium.copyWith(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700)),
                              subtitle: Text(
                                  'Publicará tu tarea hasta el día indicado.',
                                  style:
                                      Const.medium.copyWith(fontSize: 15.sp))),
                          Divider(
                              color: Const.kDividerColor2, thickness: 1.5.h),
                          ListTile(
                              onTap: () {
                                setState(() {
                                  isDateSelected = false;
                                  selectedModule = 'Acordar con el tasker';
                                });
                                Navigator.pop(context);
                              },
                              title: Text('Acordar con el tasker',
                                  style: Const.medium.copyWith(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700)),
                              subtitle: Text(
                                  'La fecha de la tarea será acordada con el Tasker.',
                                  style:
                                      Const.medium.copyWith(fontSize: 15.sp))),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(17.w, 10.h, 11.w, 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: Const.kBorderContainer),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          !isDateSelected && selectedModule.isNotEmpty
                              ? selectedModule
                              : selectedDate != null
                                  ? DateFormat(
                                      'MMMM dd',
                                    ).format(selectedDate!)
                                  : 'Seleccionar fecha o plaza',
                          style: Const.medium
                              .copyWith(fontSize: 17.sp, color: Const.kHint)),
                      Icon(Icons.keyboard_arrow_down_rounded,
                          color: Const.kHint, size: 35.h.w),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        isDateSelected
            ? Container(
                color: Const.kWhite,
                child: Column(
                  children: [
                    if (isDateSelected)
                      Padding(
                          padding: EdgeInsets.only(left: 5.w, bottom: 20.h),
                          child: CheckBoxWidget(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              title: 'Especificar un rango de horas')),
                    if (isChecked)
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Column(
                          children: [
                            MyRadioListTile(
                                title: Strings.after8,
                                value: 'Antes de las 12:00h',
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value.toString();
                                  });
                                }),
                            MyRadioListTile(
                                title: Strings.between12And16,
                                value: 'Entre 12:00h y 16:00h',
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value.toString();
                                  });
                                }),
                            MyRadioListTile(
                                title: Strings.between4And8,
                                value: 'Entre 16:00h y 20:00h',
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value.toString();
                                  });
                                }),
                            MyRadioListTile(
                                title: Strings.after8,
                                value: 'Después de las 20:00h',
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value.toString();
                                  });
                                })
                          ],
                        ),
                      ),
                    // SizedBox(height: 20.h)
                  ],
                ),
              )
            : const SizedBox(),
        const Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            child: CustomButton(
                onTap: () {
                  if (selectedDate == null && selectedModule.isEmpty) {
                    showMessage("Por favor seleccione fecha", context);
                  } else {
                    if (isChecked) {
                      if (groupValue.isNotEmpty) {
                        if (widget.isSummary) {
                          Navigator.pushReplacementNamed(
                              context, AppRouter.taskSummaryScreen);
                        } else {
                          payloadObj.addEntries({
                            "date": DateFormat(
                              'MMMM dd',
                            ).format(selectedDate!)
                          }.entries);

                          payloadObj
                              .addEntries({"isChecked": isChecked}.entries);

                          payloadObj
                              .addEntries({"groupValue": groupValue}.entries);
                          widget.pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        }
                      } else {
                        showMessage("Por favor seleccione horas", context);
                      }
                    } else {
                      if (selectedDate != null) {
                        payloadObj.addEntries({
                          "date": DateFormat(
                            'MMMM dd',
                          ).format(selectedDate!)
                        }.entries);
                      } else {
                        payloadObj.addEntries({"date": selectedModule}.entries);
                      }

                      if (widget.isSummary) {
                        Navigator.pushReplacementNamed(
                            context, AppRouter.taskSummaryScreen);
                      } else {
                        widget.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                    }
                  }
                },
                title: 'Continuar'),
          ),
        ),
      ],
    );
  }

  List dates = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];
  List month = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Puede',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];
}

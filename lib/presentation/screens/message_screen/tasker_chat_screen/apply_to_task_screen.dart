import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:itasker/application/constants.dart';

import '../../../router/routes.dart';
import '../../../shared_widget/currency_formatter.dart';
import '../../../shared_widget/custom_button.dart';
import '../../profile_screen/my_datas_screen/my_datas_screen_widget.dart';

class ApplyToTaskScreen extends StatefulWidget {
  const ApplyToTaskScreen({super.key});

  @override
  State<ApplyToTaskScreen> createState() => _ApplyToTaskScreenState();
}

class _ApplyToTaskScreenState extends State<ApplyToTaskScreen> {
  TextEditingController txtSearvices = TextEditingController();
  double price = 0.0;
  late final TextEditingController _counter;

  @override
  void initState() {
    _counter = TextEditingController(text: "1.000");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      appBar: appBarWidget(context, title: 'Aplicar a la tarea'),
      body: Padding(
        padding: EdgeInsets.all(20.h.w),
        child: Column(
          children: [
            Text('Elige tu presupuesto (CLP)',
                style: Const.medium
                    .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
            SizedBox(height: 10.h),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                height: 62.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: Const.kBorderContainer)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        double i =
                            double.parse(_counter.text.replaceAll(".", ""));
                        log(i.toString());
                        if (i != 0) {
                          i -= 1000;
                          if (i.isNegative) {
                            showMessage("la cantidad no es negativa", context);
                          } else {
                            var formatter =
                                NumberFormat.decimalPattern('vi_VN');
                            _counter.text = formatter.format(i.round());
                          }
                        }
                      }),
                      child: Container(
                        height: 52.h,
                        width: 52.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Const.kScaffoldBackground),
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextFormField(
                        controller: _counter,
                        cursorColor: Const.kBackground,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          CurrencyInputFormatter()
                        ],
                        onChanged: (value) {
                          setState(() {});
                        },
                        style: Const.medium.copyWith(
                            fontSize: 24.sp,
                            color: _counter.text == "1.000"
                                ? Const.kBlackShade6
                                : Colors.black,
                            fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                            prefix: Text(
                              "\$",
                              style: Const.medium.copyWith(
                                  fontSize: 24.sp,
                                  color: _counter.text == "1.000"
                                      ? Const.kBlackShade6
                                      : Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        double i =
                            double.parse(_counter.text.replaceAll(".", ""));
                        log(i.toString());
                        i += 1000;
                        var formatter = NumberFormat.decimalPattern('vi_VN');
                        _counter.text = formatter.format(i.round());
                      }),
                      child: Container(
                        height: 52.h,
                        width: 52.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Const.kBackground),
                        child: const Icon(Icons.add, color: Const.kWhite),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 30.h),
            CustomTextFormField(
                controller: txtSearvices,
                hint: 'Hola yo puedo ayudarte con...',
                maxLines: 8,
                topPadding: 30.h,
                hintColor: Const.kBlackShade9),
            const Spacer(),
            CustomButton(
              onTap: () =>
                  Navigator.pushNamed(context, AppRouter.successScreen2),
              title: 'Aplicar y ofertar',
            ),
          ],
        ),
      ),
    );
  }
}

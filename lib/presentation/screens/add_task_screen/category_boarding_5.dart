import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../../application/constants.dart';
import '../../shared_widget/currency_formatter.dart';

class CategoryBoarding5Screen extends StatefulWidget {
  const CategoryBoarding5Screen(
      {super.key,
      required this.pageController,
      this.isSummary = false,
      required this.selectedInd});
  final PageController pageController;
  final int selectedInd;
  final bool isSummary;

  @override
  State<CategoryBoarding5Screen> createState() =>
      _CategoryBoarding5ScreenState();
}

class _CategoryBoarding5ScreenState extends State<CategoryBoarding5Screen> {
  final TextEditingController _counter = TextEditingController(text: "1.000");
  double price = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Const.kWhite,
          child: Padding(
            padding: EdgeInsets.all(20.h.w),
            child: Column(
              children: [
                Text('Elige tu presupuesto (CLP)',
                    style: Const.bold.copyWith(fontSize: 30.sp)),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  height: 62.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: Const.kBorderContainer)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          double i =
                              double.parse(_counter.text.replaceAll(".", ""));
                          log(i.toString());
                          if (i != 0) {
                            i -= 1000;
                            if (i.isNegative) {
                              showMessage(
                                  "la cantidad no es negativa", context);
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
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            child: CustomButton(
                onTap: () {
                  payloadObj.addEntries({"budget": _counter.text}.entries);
                  if (widget.isSummary) {
                    Navigator.pushReplacementNamed(
                        context, AppRouter.taskSummaryScreen);
                  } else {
                    Navigator.pushNamed(context, AppRouter.taskSummaryScreen);
                  }
                },
                title: 'Continuar'),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/screens/onboarding/widget/onboarding_1.dart';
import 'package:itasker/presentation/screens/onboarding/widget/onboarding_2.dart';
import 'package:itasker/presentation/screens/onboarding/widget/onboarding_3.dart';
import 'package:itasker/presentation/screens/onboarding/widget/onboarding_4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared_widget/custom_button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final pgList = [
    const OnBoarding1(),
    const OnBoarding2(),
    const OnBoarding3(),
    const OnBoarding4(),
  ];
  int _selectedInd = 0;
  final PageController _pgController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                Strings.boardingTitle,
                textAlign: TextAlign.center,
                style: Const.bold.copyWith(fontSize: 30.sp),
              ),
              SizedBox(
                height: 25.h,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pgController,
                  padEnds: true,
                  itemCount: pgList.length,
                  onPageChanged: (value) {
                    setState(() {
                      _selectedInd = value;
                    });
                  },
                  itemBuilder: (context, index) => pgList[index],
                ),
              ),
              //  const Spacer(),
              SmoothPageIndicator(
                  controller: _pgController,
                  count: 4,
                  axisDirection: Axis.horizontal,
                  effect: const SwapEffect(
                      spacing: 8.0,
                      //   type: SwapType.normal,
                      radius: 20.0,
                      dotWidth: 12.0,
                      dotHeight: 12.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: Const.kBlue)),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                onTap: () {
                  if (_selectedInd < pgList.length - 1) {
                    _pgController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRouter.login, (route) => false);
                  }
                },
                title: _selectedInd < pgList.length - 1
                    ? Strings.boardingButton
                    : Strings.boardingButton2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

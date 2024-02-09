import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/application/string.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/screens/auth_screen/register_boarding/register_boarding_1.dart';
import 'package:itasker/presentation/screens/auth_screen/register_boarding/register_boarding_2.dart';
import 'package:itasker/presentation/screens/auth_screen/register_boarding/register_boarding_3.dart';
import 'package:itasker/presentation/screens/auth_screen/register_boarding/register_boarding_4.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

class RegisterOnboarding extends StatefulWidget {
  const RegisterOnboarding({super.key});

  @override
  State<RegisterOnboarding> createState() => _RegisterOnboardingState();
}

class _RegisterOnboardingState extends State<RegisterOnboarding> {
  List pgList = [];
  final TextEditingController _email = TextEditingController();
  final PageController _pageController = PageController();
  int _selectedInd = 0;

  @override
  void initState() {
    pgList = [
      RegisterBoarding1(email: _email),
      const RegisterBoarding2(),
      const RegisterBoarding3(),
      const RegisterBoarding4()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      appBar: AppBar(
        backgroundColor: Const.kWhite,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child:
                const Icon(Icons.arrow_back_ios_rounded, color: Const.kBlack)),
        title: Text(
          "Paso ${_selectedInd == 0 || _selectedInd == 1 ? "1" : _selectedInd} de 3",
          style: Const.medium.copyWith(
              color: Const.kBlack,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 7),
            child: LinearProgressIndicator(
              value: (_selectedInd == 0 || _selectedInd == 1)
                  ? 0.1
                  : _selectedInd == 2
                      ? 0.5
                      : 0.9,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Const.kBackground),
              backgroundColor: Const.kProgressBorder,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  _selectedInd = value;
                });
              },
              controller: _pageController,
              itemBuilder: (context, index) => pgList[index],
              itemCount: pgList.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h.w, right: 20.w, left: 20.w),
            child: Column(
              children: [
                CustomButton(
                    onTap: () {
                      if (_selectedInd == 3) {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRouter.passwordSuccess,
                            arguments: {
                              "isRegister": true,
                              "name": _email.text
                            },
                            (route) => false);
                      } else {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                    },
                    title:
                        _selectedInd == 3 ? Strings.finish : Strings.countinue),
                if (_selectedInd == 1)
                  SizedBox(
                    height: 10.h,
                  ),
                if (_selectedInd == 1)
                  CustomButton(
                    onTap: () {},
                    style: Const.buttonBorderStyle,
                    title: Strings.resendCode,
                    txtStyle: Const.bold
                        .copyWith(fontSize: 15.sp, color: Const.kBlack),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/presentation/screens/add_task_screen/category_boarding_1.dart';
import 'package:itasker/presentation/screens/add_task_screen/category_boarding_3.dart';
import 'package:itasker/presentation/screens/add_task_screen/category_boarding_4.dart';
import 'package:itasker/presentation/screens/add_task_screen/category_boarding_5.dart';

import '../../../application/constants.dart';
import '../../../gen/assets.gen.dart';
import 'category_boarding_2.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen(
      {super.key, this.isSummary = false, this.initialInd = 0});
  final int initialInd;
  final bool isSummary;
  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  int selectedInd = 0;
  List pgList = [];
  late final PageController pageController;

  @override
  void initState() {
    selectedInd = widget.initialInd;
    pageController = PageController(initialPage: selectedInd);
    pgList = [
      CategoryBoarding1Screen(
          isSummary: widget.isSummary,
          pageController: pageController,
          selectedInd: selectedInd),
      CategoryBoarding2Screen(
          isSummary: widget.isSummary,
          pageController: pageController,
          selectedInd: selectedInd),
      CategoryBoarding3Screen(
          isSummary: widget.isSummary,
          pageController: pageController,
          selectedInd: selectedInd),
      CategoryBoarding4Screen(
          isSummary: widget.isSummary,
          pageController: pageController,
          selectedInd: selectedInd),
      CategoryBoarding5Screen(
          isSummary: widget.isSummary,
          pageController: pageController,
          selectedInd: selectedInd),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: AppBar(
        backgroundColor: Const.kWhite,
        elevation: 0,
        centerTitle: true,
        leading: Row(
          children: [
            SizedBox(width: 15.w),
            GestureDetector(
                onTap: selectedInd == 0
                    ? () => Navigator.pop(context)
                    : () {
                        pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                child: const Icon(Icons.arrow_back_ios_rounded,
                    color: Const.kBlack)),
            SizedBox(width: 10.w),
            CircleAvatar(
              backgroundColor: Const.kGreenAccentLigth,
              child: Assets.images.technology.image(height: 18.h, width: 18.w),
            )
          ],
        ),
        leadingWidth: 100.w,
        title: Text(
          "Paso ${selectedInd == 0 ? '1' : selectedInd == 1 ? "2" : selectedInd == 2 ? '3' : selectedInd == 3 ? '4' : '5'} de 5",
          style: Const.medium.copyWith(
              color: Const.kBlack,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 7),
          child: LinearProgressIndicator(
            value: selectedInd == 0
                ? 0.2
                : selectedInd == 1
                    ? 0.4
                    : selectedInd == 2
                        ? 0.6
                        : selectedInd == 3
                            ? 0.8
                            : 0.9,
            valueColor: const AlwaysStoppedAnimation<Color>(Const.kBackground),
            backgroundColor: Const.kProgressBorder,
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                selectedInd = value;
              });
            },
            controller: pageController,
            itemBuilder: (context, index) => pgList[index],
            itemCount: pgList.length,
          ),
        ],
      ),
    );
  }
}

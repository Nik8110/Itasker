import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/gen/assets.gen.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/screens/list_screen/list_screen.dart';
import 'package:itasker/presentation/screens/message_screen/message_screen.dart';
import 'package:itasker/presentation/screens/my_task_screen/my_task_screen.dart';
import 'package:itasker/presentation/screens/profile_screen/profile_screen.dart';

import '../../../application/string.dart';
import '../add_task_screen/add_task_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({this.selectedInd = 0, super.key});

  final int selectedInd;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedInd = 0;

  @override
  void initState() {
    getIndex();
    super.initState();
  }

  getIndex() {
    setState(() {
      _selectedInd = widget.selectedInd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      body: IndexedStack(index: _selectedInd, children: const [
        ListScreen(),
        MyTaskScreen(),
        AddTaskScreen(),
        MessageScreen(),
        ProfileScreen()
      ]),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Const.kBackground,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          elevation: 0,
          backgroundColor: Const.kWhite,
          unselectedLabelStyle: Const.medium.copyWith(
            fontSize: 10.sp,
            color: Const.kBackground,
          ),
          selectedLabelStyle: Const.medium.copyWith(
            fontSize: 10.sp,
            color: Const.kBorder,
          ),
          currentIndex: _selectedInd,
          onTap: (value) {
            if (value == 2) {
              Navigator.pushNamed(context, AppRouter.addTaskScreen).then((_) {
                setState(() {
                  _selectedInd = 0;
                });
              });
            } else {
              setState(() {
                _selectedInd = value;
              });
            }
          },
          selectedIconTheme: const IconThemeData(color: Const.kBackground),
          items: _bottombarList),
    );
  }

  final List<BottomNavigationBarItem> _bottombarList = [
    BottomNavigationBarItem(
        label: Strings.listings,
        activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Assets.svg.listing
              .svg(height: 26.h, color: Const.kBackground, width: 26.w),
        ),
        icon: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Assets.svg.listing.svg(height: 26.h, width: 26.w),
        )),
    BottomNavigationBarItem(
        label: Strings.myTask,
        activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Assets.svg.myTask
              .svg(height: 26.h, color: Const.kBackground, width: 26.w),
        ),
        icon: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Assets.svg.myTask.svg(height: 26.h, width: 26.w),
        )),
    BottomNavigationBarItem(
      label: '',
      activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 0.h),
          child: Assets.svg.add.svg(height: 42.h, width: 42.w)),
      icon: Padding(
        padding: EdgeInsets.only(bottom: 0.h),
        child: Assets.svg.add.svg(height: 42.h, width: 42.w),
      ),
    ),
    // BottomNavigationBarItem(
    //   label: '',
    //   icon: FloatingActionButton(
    //     mini: true,
    //     onPressed: ()=>Navigator.pushNamed(context,AppRouter.addTaskScreen),
    //     elevation: 0,
    //     backgroundColor: Const.kBackground,
    //     child: Assets.svg.add.svg(height: 42.h, width: 42.w),
    //   ),
    // ),
    BottomNavigationBarItem(
        label: Strings.messages,
        activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Assets.svg.messages
              .svg(height: 26.h, color: Const.kBackground, width: 26.w),
        ),
        icon: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Assets.svg.messages.svg(height: 26.h, width: 26.w),
        )),
    BottomNavigationBarItem(
        label: Strings.myProfile,
        activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Assets.svg.profile
              .svg(height: 26.h, color: Const.kBackground, width: 26.w),
        ),
        icon: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Assets.svg.profile
              .svg(height: 26.h, color: Const.kBorder, width: 26.w),
        ))
  ];
}

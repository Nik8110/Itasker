import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/screens/profile_screen/my_profile_screen/my_reputation_screen/my_reputation_screen_widget.dart';

class MyReputationScreen extends StatefulWidget {
  const MyReputationScreen({super.key});

  @override
  State<MyReputationScreen> createState() => _MyReputationScreenState();
}

class _MyReputationScreenState extends State<MyReputationScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  int tabindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, title: 'Mi Reputación'),
      body: Column(
        children: [
          Container(
            height: 60.h,
            child: TabBar(
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              indicatorPadding: EdgeInsets.only(top: 10.h),
              indicatorColor: Const.kBackground,
              onTap: (value) {
                setState(() {
                  tabindex = value;
                });
              },
              overlayColor: MaterialStateProperty.resolveWith((states) {
                return Colors.transparent;
              }),
              tabs: [
                Text(
                  'Tasker',
                  style: tabindex == 0
                      ? Const.medium.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Const.kBackground)
                      : Const.medium.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Const.kBlackShade6),
                ),
                Text(
                  'Ofertante',
                  style: tabindex == 1
                      ? Const.medium.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Const.kBackground)
                      : Const.medium.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Const.kBlackShade6),
                ),
              ],
            ),
          ),
          // SizedBox(height: 20.h),
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return true;
            },
            child: SizedBox(
              height: 465.h,
              child: TabBarView(
                controller: tabController,
                children: [
                  ContainerWidget(),
                  ContainerWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

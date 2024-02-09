import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/screens/profile_screen/my_profile_screen/my_reputation_screen/my_reputation_screen_widget.dart';

class ViewProfileAsUserScreen extends StatefulWidget {
  final bool isShow;

  const ViewProfileAsUserScreen({super.key, required this.isShow});

  @override
  State<ViewProfileAsUserScreen> createState() =>
      _ViewProfileAsUserScreenState();
}

class _ViewProfileAsUserScreenState extends State<ViewProfileAsUserScreen>
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
      backgroundColor: Const.kScaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Container(
                height: 743.h,
                color: Const.kWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 260.h,
                      child: Stack(
                        children: [
                          Container(
                            color: Const.kBackground,
                            height: 180.h,
                            width: double.infinity,
                          ),
                          Positioned(
                            top: 40.h,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Const.kWhite,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Text(
                                  widget.isShow
                                      ? ''
                                      : 'Como te ven otros usuarios',
                                  style: Const.medium.copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Const.kWhite,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 110.h,
                            left: 110.w,
                            child: CircleAvatar(
                              maxRadius: 70.r,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Pedro Vasquez',
                            style: Const.bold
                                .copyWith(fontSize: 22.sp, color: Const.kBlack),
                          ),
                          SizedBox(height: 10.h),
                          RichWidget(
                            text: 'Miembro desde:',
                            style: Const.medium.copyWith(
                              fontSize: 15.sp,
                              color: Const.kBlackShade4,
                            ),
                            span: [
                              TextSpan(
                                text: ' 29 ene 2023',
                                style: Const.medium.copyWith(
                                  fontSize: 15.sp,
                                  color: Const.kBlackShade5,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Santiago Centro, Santiago, Chile',
                            style: Const.medium.copyWith(
                              fontSize: 15.sp,
                              color: Const.kBlackShade4,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Última conexión: hace 1 día',
                            style: Const.medium.copyWith(
                              fontSize: 15.sp,
                              color: Const.kBlackShade6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Padding(
                      padding: EdgeInsets.all(20.h.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sobre mí',
                            style: Const.bold
                                .copyWith(fontSize: 22.sp, color: Const.kBlack),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adiping elit. Donec non leo a nisl iaculis gravida in eget ante. Ut sem ligula, ultrices ut interdum sit amet.',
                            style: Const.medium
                                .copyWith(fontSize: 15.sp, color: Const.kBlack),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            'Grupos de interés',
                            style: Const.bold
                                .copyWith(fontSize: 22.sp, color: Const.kBlack),
                          ),
                          SizedBox(height: 20.h),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30.h.w,
                                  backgroundColor: Const.kYellowDark,
                                ),
                                SizedBox(width: 10.w),
                                CircleAvatar(
                                  radius: 30.h.w,
                                  backgroundColor: Const.kBlueLight,
                                ),
                                SizedBox(width: 10.w),
                                CircleAvatar(
                                  radius: 30.h.w,
                                  backgroundColor: Const.kYellowAccentLigth,
                                ),
                                SizedBox(width: 10.w),
                                CircleAvatar(
                                  radius: 30.h.w,
                                  backgroundColor: Const.kYellowDark,
                                ),
                                SizedBox(width: 10.w),
                                CircleAvatar(
                                  radius: 30.h.w,
                                  backgroundColor: Const.kBlueLight,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.all(10.h.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  height: 580.h,
                  decoration: BoxDecoration(
                    color: Const.kWhite,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70.h,
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
                      NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (notification) {
                          notification.disallowIndicator();
                          return true;
                        },
                        child: Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              ContainerWidget(width: 240),
                              ContainerWidget(width: 240),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 37.h),
          ],
        ),
      ),
    );
  }
}

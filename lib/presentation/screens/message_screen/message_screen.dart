import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/constants.dart';
import '../../router/routes.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: AppBar(
        backgroundColor: Const.kWhite,
        elevation: 0,
        leading: null,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 0),
          child: TabBar(
            controller: tabController,
            indicatorColor: Const.kBackground,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.only(bottom: 14.h),
            indicatorWeight: 3,
            onTap: (value) {
              setState(() {
                tabIndex = value;
              });
            },
            overlayColor: MaterialStateProperty.resolveWith((states) {
              return Colors.transparent;
            }),
            tabs: [
              Text(
                'Tasker',
                style: tabIndex == 0
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
                style: tabIndex == 1
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
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => ListTile(
              tileColor: Const.kWhite,
              onTap: () => Navigator.pushNamed(
                  context, AppRouter.taskerChatScreen,
                  arguments: 'Editar mis datos'),
              visualDensity: const VisualDensity(vertical: 3),
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              leading: Container(
                height: 48.h,
                width: 48.w,
                decoration: const BoxDecoration(
                    color: Const.kBackground, shape: BoxShape.circle),
              ),
              title: Text('Paula S.',
                  style: Const.medium.copyWith(
                      fontSize: 17.sp,
                      color: Const.kBlack,
                      fontWeight: FontWeight.w700)),
              subtitle: Text('Hola Pedro, mañana a las 12:00 e...',
                  style: Const.medium.copyWith(
                      fontSize: 13.sp,
                      color: Const.kBlackShade6,
                      overflow: TextOverflow.ellipsis)),
              trailing: Text('10:57 a.m.',
                  style: Const.medium.copyWith(fontSize: 13.sp)),
            ),
          ),
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) => ListTile(
              tileColor: Const.kScaffoldBackground,
              onTap: () =>
                  Navigator.pushNamed(context, AppRouter.offerorChatScreen),
              visualDensity: const VisualDensity(vertical: 3),
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              leading: Container(
                height: 48.h,
                width: 48.w,
                decoration: const BoxDecoration(
                    color: Const.kBackground, shape: BoxShape.circle),
              ),
              title: Text('Carla G.',
                  style: Const.medium.copyWith(
                      fontSize: 17.sp,
                      color: Const.kBlack,
                      fontWeight: FontWeight.w700)),
              subtitle: Text('Me puedes confirmar la dirección...',
                  style: Const.medium.copyWith(
                      fontSize: 13.sp,
                      color: Const.kBlackShade6,
                      overflow: TextOverflow.ellipsis)),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('10:57 a.m.',
                      style: Const.medium.copyWith(fontSize: 13.sp)),
                  CircleAvatar(
                    radius: 13.r,
                    child: Text(index.toString(),
                        style: Const.medium
                            .copyWith(fontSize: 13.sp, color: Const.kWhite)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

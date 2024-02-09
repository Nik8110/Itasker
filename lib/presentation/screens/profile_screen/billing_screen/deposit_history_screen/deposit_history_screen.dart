import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

class DepositHistoryScreen extends StatelessWidget {
  const DepositHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: appBarWidget(context, title: 'Historial de depósitos'),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.h.w),
            child: Text('Últimas fechas de depósito',
                style: Const.medium
                    .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
          ),
          // SizedBox(height: 10.h),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 13.w),
            elevation: 0,
            color: Const.kWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
              side: const BorderSide(color: Const.kBorderContainer),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 15,
              separatorBuilder: (context, index) =>
                  const Divider(color: Const.kDividerColor, thickness: 2),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: ListTile(
                  contentPadding: EdgeInsets.only(right: 60.w, left: 20.w),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Periodo',
                            style: Const.medium.copyWith(
                                fontSize: 13.sp, color: Const.kBlackShade4),
                          ),
                          Text(
                            'Mayo',
                            style: Const.medium.copyWith(fontSize: 17.sp),
                          ),
                          // SizedBox(height: 20.h),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Monto',
                            style: Const.medium.copyWith(
                                fontSize: 13.sp, color: Const.kBlackShade4),
                          ),
                          Text(
                            '\$ 71853.000',
                            style: Const.medium.copyWith(fontSize: 17.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Fecha',
                        style: Const.medium.copyWith(
                            fontSize: 13.sp, color: Const.kBlackShade4),
                      ),
                      Text(
                        '02/abr/2023',
                        style: Const.medium.copyWith(fontSize: 17.sp),
                      ),
                    ],
                  ),
                  // trailing:
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

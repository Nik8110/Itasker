import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/screens/profile_screen/performance_as_tasker_screen/performance_as_tasker_screen_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../gen/assets.gen.dart';
import '../../../shared_widget/custom_button.dart';

class PerformanceAsTaskerScreen extends StatefulWidget {
  const PerformanceAsTaskerScreen({super.key});

  @override
  State<PerformanceAsTaskerScreen> createState() =>
      _PerformanceAsTaskerScreenState();
}

class _PerformanceAsTaskerScreenState extends State<PerformanceAsTaskerScreen> {
  bool? isShowDesc;

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    isShowDesc = true;
    data = [
      _ChartData('Sem 1', 3000.000),
      _ChartData('Sem 2', 7000.000),
      _ChartData('Sem 3', 4300.000),
      _ChartData('Sem 4', 1000.000),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  String isSelectedMonth = 'ABRIL 2023';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: appBarWidget(
        context,
        title: 'Desempeño como Tasker',
        onPressed: () => setState(() {
          isShowDesc == false ? isShowDesc = true : Navigator.pop(context);
        }),
      ),
      body: isShowDesc!
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    'No tienes Tareas Finalizadas',
                    style: Const.medium.copyWith(fontSize: 17.sp),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Finaliza Tareas y habilita la sección de Tu\ndesempeño como Tasker.',
                    textAlign: TextAlign.center,
                    style: Const.medium.copyWith(fontSize: 13.sp),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                      onTap: () {
                        setState(() {
                          isShowDesc = false;
                        });
                      },
                      title: 'Ver Listado'),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();
                  return true;
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Container(
                        height: 90.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Const.kWhite,
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: Const.kBorderContainer)),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '4',
                                  textAlign: TextAlign.center,
                                  style: Const.medium.copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  'Tareas en curso',
                                  textAlign: TextAlign.center,
                                  style: Const.medium.copyWith(fontSize: 14.sp),
                                ),
                              ],
                            ),
                            SizedBox(width: 43.w),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$123.000',
                                  textAlign: TextAlign.center,
                                  style: Const.medium.copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5.h),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isShowDesc = true;
                                    });
                                  },
                                  child: Text(
                                    'Saldo actual',
                                    textAlign: TextAlign.center,
                                    style:
                                        Const.medium.copyWith(fontSize: 14.sp),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Estadísticas',
                        style: Const.bold.copyWith(fontSize: 22.sp),
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        height: 655.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Const.kWhite,
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: Const.kBorderContainer),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => SizedBox(
                                    height: 380.h,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.w, top: 20.h, right: 20.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10.w),
                                                child: Text(
                                                  'Selecciona el mes',
                                                  style: Const.medium.copyWith(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              const Spacer(),
                                              GestureDetector(
                                                  onTap: () =>
                                                      Navigator.pop(context),
                                                  child:
                                                      const Icon(Icons.close))
                                            ],
                                          ),
                                          SizedBox(height: 20.h),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                isSelectedMonth = 'MARZO 2023';
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'MARZO 2023',
                                              style: Const.medium.copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                isSelectedMonth =
                                                    'FEBRERO 2023';
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'FEBRERO 2023',
                                              style: Const.medium.copyWith(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  isSelectedMonth =
                                                      'ENERO 2023';
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text('ENERO 2023',
                                                  style: Const.medium.copyWith(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w500))),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  isSelectedMonth =
                                                      'DICIEMBRE 2022';
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text('DICIEMBRE 2022',
                                                  style: Const.medium.copyWith(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w500))),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  isSelectedMonth =
                                                      'NOVIEMBRE 2022';
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text('NOVIEMBRE 2022',
                                                  style: Const.medium.copyWith(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w500))),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  isSelectedMonth =
                                                      'MARZOOCTUBRE 2022';
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text('MARZOOCTUBRE 2022',
                                                  style: Const.medium.copyWith(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w500)))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 42.h,
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                        color: Const.kBorderContainer2)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Text(isSelectedMonth,
                                        style: Const.medium
                                            .copyWith(fontSize: 17.sp)),
                                    const Spacer(),
                                    const Icon(
                                        size: 20,
                                        Icons.arrow_forward_ios_rounded,
                                        color: Const.kBlackShade3),
                                    SizedBox(width: 10.w),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: SfCartesianChart(
                                plotAreaBorderWidth: 0,
                                primaryXAxis: CategoryAxis(
                                    arrangeByIndex: true,
                                    majorGridLines:
                                        const MajorGridLines(width: 0),
                                    majorTickLines:
                                        const MajorTickLines(width: 0)),
                                primaryYAxis: NumericAxis(
                                    minimum: 0000.000,
                                    maximum: 8000.000,
                                    interval: 2000.000,
                                    labelStyle:
                                        Const.medium.copyWith(fontSize: 13.sp),
                                    // labelFormat: '\$',
                                    numberFormat:
                                        NumberFormat.decimalPatternDigits(
                                            decimalDigits: 3),
                                    axisLine: const AxisLine(width: 0),
                                    majorTickLines:
                                        const MajorTickLines(width: 0)),
                                tooltipBehavior: _tooltip,
                                series: <ChartSeries<_ChartData, String>>[
                                  ColumnSeries<_ChartData, String>(
                                    dataSource: data,
                                    xValueMapper: (_ChartData data, _) =>
                                        data.x,
                                    yValueMapper: (_ChartData data, _) =>
                                        data.y,
                                    name: '',
                                    color: Const.kBackground,
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                                color: Const.kBorderContainer2, thickness: 1.5),
                            SizedBox(height: 5.h),
                            const ChartDataWidget(
                                title: 'Saldo acumulado', value: '\$ 9900.530'),
                            SizedBox(height: 5.h),
                            const Divider(
                                color: Const.kBorderContainer2, thickness: 1.5),
                            SizedBox(height: 5.h),
                            const ChartDataWidget(
                                title: 'Promedio por tarea',
                                value: '\$412.275'),
                            SizedBox(height: 5.h),
                            const Divider(
                                color: Const.kBorderContainer2, thickness: 1.5),
                            SizedBox(height: 5.h),
                            const ChartDataWidget(
                                title: 'Tareas Finalizadas', value: '24'),
                            SizedBox(height: 5.h),
                            const Divider(
                                color: Const.kBorderContainer2, thickness: 1.5),
                            SizedBox(height: 5.h),
                            const ChartDataWidget(
                                title: 'Tareas Aplicadas', value: '39'),
                            SizedBox(height: 5.h),
                            const Divider(
                                color: Const.kBorderContainer2, thickness: 1.5),
                            SizedBox(height: 5.h),
                            ChartDataWidget(
                              title: 'Reputación',
                              value: '4.5',
                              widget: Assets.svg.starRounded.svg(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

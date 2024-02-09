import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/gen/assets.gen.dart';
import 'package:itasker/presentation/router/routes.dart';

class ChooseTaskCategoriesScreen extends StatelessWidget {
  ChooseTaskCategoriesScreen({this.isTaskSummary = false, super.key});
  bool isTaskSummary;
  List<Map> interestGroupList = [
    {
      'icon': Assets.images.maestranza.image(height: 42.h, width: 42.w),
      'text': 'Maestranza',
      'color': Const.kYellowDark,
    },
    {
      'icon': Assets.images.animals.image(height: 42.h, width: 42.w),
      'text': 'Animales',
      'color': Const.kBlueLight,
    },
    {
      'icon': Assets.images.gardening.image(height: 42.h, width: 42.w),
      'text': 'Jardinería',
      'color': Const.kGreenLight,
    },
    {
      'icon': Assets.images.cleaning.image(height: 42.h, width: 42.w),
      'text': 'Limpieza',
      'color': Const.kPinkLight,
    },
    {
      'icon': Assets.images.technology.image(height: 42.h, width: 42.w),
      'text': 'Tecnología',
      'color': Const.kGreenAccentLigth,
    },
    {
      'icon': Assets.images.aid.image(height: 42.h, width: 42.w),
      'text': 'Ayuda',
      'color': Const.kYellowAccentLigth,
    },
    {
      'icon': Assets.images.sales.image(height: 42.h, width: 42.w),
      'text': 'Ventas',
      'color': Const.kindigoLight,
    },
    {
      'icon': Assets.images.beautyCarePersonal.image(height: 42.h, width: 42.w),
      'text': 'Belleza,\nCuidado, Personal',
      'color': Const.kBlueLight,
    },
    {
      'icon': Assets.images.transportation.image(height: 42.h, width: 42.w),
      'text': 'Flete, Transporte',
      'color': Const.kYellowLigth,
    },
    {
      'icon': Assets.images.meal.image(height: 42.h, width: 42.w),
      'text': 'Comida',
      'color': Const.kYellowAccentDark,
    },
    {
      'icon': Assets.images.online.image(height: 42.h, width: 42.w),
      'text': 'Online',
      'color': Const.kindigoLight,
    },
    {
      'icon': Assets.images.other.image(height: 42.h, width: 42.w),
      'text': 'Otros',
      'color': Const.kYellowLigth,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context,
          title: 'Elige la categoría de la tarea',
          iconColor: Const.kBlack,
          textColor: Const.kBlack,
          backgroundColor: Const.kWhite),
      body: Padding(
        padding: EdgeInsets.all(10.h.w),
        child: GridView.builder(
          itemCount: interestGroupList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            childAspectRatio: 0.6.h,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              if (isTaskSummary) {
                payloadObj.removeWhere(
                  (key, value) => key == "category",
                );
                payloadObj.addEntries(
                    {"category": interestGroupList[index]['text']}.entries);
                Navigator.pushReplacementNamed(
                  context,
                  AppRouter.taskSummaryScreen,
                );
              } else {
                payloadObj.addEntries(
                    {"category": interestGroupList[index]['text']}.entries);
                Navigator.pushNamed(context, AppRouter.categoryDetailsScreen,
                    arguments: {"isSummary": false});
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Const.kWhite,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5)
                  ]),
              padding: EdgeInsets.all(15.h.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: interestGroupList[index]['color'],
                    child: interestGroupList[index]['icon'],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    interestGroupList[index]['text'],
                    textAlign: TextAlign.center,
                    style: Const.medium
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

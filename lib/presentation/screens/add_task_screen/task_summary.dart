// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/screens/add_task_screen/category_detail_screen.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../../application/constants.dart';
import '../../../gen/assets.gen.dart';

class TaskSummaryScreen extends StatelessWidget {
  const TaskSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Const.kWhite,
        leading: Padding(
          padding: EdgeInsets.all(10.h.w),
          child: CircleAvatar(
            backgroundColor: Const.kGreenAccentLigth,
            child: Assets.images.technology.image(height: 18.h, width: 18.w),
          ),
        ),
        title: Text('Resumen de tarea',
            style: Const.medium
                .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close, color: Const.kBlack))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Const.kWhite,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, AppRouter.chooseTaskCategoriesScreen,
                            arguments: true),
                        title: Text('Categoría de la tarea',
                            style: Const.medium.copyWith(
                                fontSize: 15.sp, fontWeight: FontWeight.w700)),
                        subtitle: Text(payloadObj['category'],
                            style: Const.medium.copyWith(fontSize: 15.sp)),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            color: Const.kBlackShade3),
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, AppRouter.categoryDetailsScreen,
                            arguments: {"isSummary": true}),
                        title: Text('Título de solicitud',
                            style: Const.medium.copyWith(
                                fontSize: 15.sp, fontWeight: FontWeight.w700)),
                        subtitle: Text(payloadObj['title'],
                            style: Const.medium.copyWith(fontSize: 15.sp)),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            color: Const.kBlackShade3),
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryDetailsScreen(
                                  initialInd: 1, isSummary: true),
                            )),
                        title: Text('Fecha',
                            style: Const.medium.copyWith(
                                fontSize: 15.sp, fontWeight: FontWeight.w700)),
                        subtitle: Text(
                            payloadObj['date'] +
                                (payloadObj.containsKey("groupValue")
                                    ? "-" + payloadObj["groupValue"]
                                    : ""),
                            overflow: TextOverflow.ellipsis,
                            style: Const.medium.copyWith(fontSize: 15.sp)),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            color: Const.kBlackShade3),
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryDetailsScreen(
                                  initialInd: 2, isSummary: true),
                            )),
                        title: Text('Ubicación de referencia',
                            style: Const.medium.copyWith(
                                fontSize: 15.sp, fontWeight: FontWeight.w700)),
                        subtitle: Text(payloadObj['address'],
                            overflow: TextOverflow.ellipsis,
                            style: Const.medium.copyWith(fontSize: 15.sp)),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            color: Const.kBlackShade3),
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryDetailsScreen(
                                  initialInd: 3, isSummary: true),
                            )),
                        title: Text('Detalles de solicitud',
                            style: Const.medium.copyWith(
                                fontSize: 15.sp, fontWeight: FontWeight.w700)),
                        subtitle: Text(payloadObj['details'],
                            overflow: TextOverflow.ellipsis,
                            style: Const.medium.copyWith(fontSize: 15.sp)),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            color: Const.kBlackShade3),
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  (payloadObj['images'] as List<File>).length,
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.only(right: 10.w),
                                width: 100.h,
                                decoration: BoxDecoration(
                                  color: Const.kBorderContainer,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                    child: Image.file(
                                        payloadObj['images'][index])),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryDetailsScreen(initialInd: 4),
                                )),
                            title: Text('Presupuesto',
                                style: Const.medium.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700)),
                            subtitle: Text('\$${payloadObj['budget']}',
                                overflow: TextOverflow.ellipsis,
                                style: Const.medium.copyWith(fontSize: 15.sp)),
                            trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Const.kBlackShade3),
                            contentPadding: const EdgeInsets.all(0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
              padding: EdgeInsets.all(20.h.w),
              child: CustomButton(
                  onTap: () {
                    payloadObj.clear();
                    Navigator.pushNamed(context, AppRouter.successScreen4);
                  },
                  title: 'Publicar')),
        ],
      ),
    );
  }
}

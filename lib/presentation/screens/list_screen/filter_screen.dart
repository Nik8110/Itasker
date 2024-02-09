import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../../gen/assets.gen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Map> filterData = [
    {'title': 'Todos', 'isChecked': false},
    {'title': 'Comuna 1', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 1', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 1', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 1', 'isChecked': false},
    {'title': 'Comuna 2', 'isChecked': false},
    {'title': 'Comuna 1', 'isChecked': false},
  ];
  List<Map> searchFilterData = [];
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: appBarWidget(context,
          title: 'Elige Comuna',
          textColor: Const.kBlack,
          iconColor: Const.kBlack,
          backgroundColor: Const.kWhite),
      body: Column(
        children: [
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              height: 40.h,
              width: 334.w,
              child: TextField(
                controller: txtSearch,
                onChanged: (value) {
                  setState(() {
                    searchFilterData = filterData
                        .where((item) => item['title']!
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Const.kWhite,
                  hintText: 'Buscar',
                  contentPadding: EdgeInsets.only(top: 5.h),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.h.w),
                    child: Assets.svg.search.svg(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Const.kBorderContainer),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Const.kBorderContainer),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  hintStyle: Const.medium
                      .copyWith(fontSize: 15.sp, color: Colors.grey),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          txtSearch.text.isNotEmpty
              ? Expanded(
                  child: Container(
                    color: Const.kWhite,
                    padding: EdgeInsets.only(left: 20.w, right: 10.w),
                    child: ListView.builder(
                      itemCount: searchFilterData.length,
                      itemBuilder: (context, index) => SizedBox(
                        height: 40.h,
                        child: Row(
                          children: [
                            Text(
                              searchFilterData[index]['title'],
                              style: Const.medium.copyWith(fontSize: 15.sp),
                            ),
                            const Spacer(),
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                value: searchFilterData[index]['isChecked'],
                                onChanged: (value) {
                                  setState(() {
                                    searchFilterData[index]['isChecked'] =
                                        value;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                splashRadius: 0,
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => const BorderSide(
                                      width: 1.0,
                                      color: Const.kBorderContainer),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: Container(
                    color: Const.kWhite,
                    padding: EdgeInsets.only(left: 20.w, right: 10.w),
                    child: ListView.builder(
                        itemCount: filterData.length,
                        itemBuilder: (context, index) => SizedBox(
                              height: 40.h,
                              child: Row(
                                children: [
                                  Text(
                                    filterData[index]['title'],
                                    style:
                                        Const.medium.copyWith(fontSize: 15.sp),
                                  ),
                                  const Spacer(),
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                      value: filterData[index]['isChecked'],
                                      onChanged: (value) {
                                        setState(() {
                                          filterData[index]['isChecked'] =
                                              value;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      splashRadius: 0,
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                            width: 1.0,
                                            color: Const.kBorderContainer),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                  ),
                ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            child: CustomButton(
                onTap: () => Navigator.pop(context), title: 'Filtrar'),
          )
        ],
      ),
    );
  }
}

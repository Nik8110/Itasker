import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../application/constants.dart';
import '../../../gen/assets.gen.dart';

class DetailCard extends StatelessWidget {
  DetailCard({
    super.key,
    this.title,
    this.taskTitle,
    this.taskColor,
    this.isPanding = false,
    this.onTap,
    this.cardOnTap,
  });

  String? title, taskTitle;
  Color? taskColor;
  bool isPanding;
  void Function()? onTap;
  void Function()? cardOnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardOnTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.h.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Const.kBlueLight,
                        child: Assets.images.animals.image(scale: 4),
                      ),
                      SizedBox(width: 10.w),
                      Text(title ?? 'Transcribir documento al español',
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w600)),
                      const Spacer(),
                      isPanding
                          ? CircleAvatar(
                              radius: 13.r,
                              backgroundColor: Const.kBlueShad2,
                              child: Text('2',
                                  style: Const.medium.copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Const.kWhite)),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non leo a nisl iaculis gravida in eget leo a',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Const.medium.copyWith(
                          fontSize: 13.sp, color: Const.kBlackShade1)),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          color: Const.kBackground, size: 16.r),
                      SizedBox(width: 5.w),
                      Text(
                        'Santiago Centro, Santiago, Chile',
                        style: Const.medium.copyWith(
                            fontSize: 11.sp, color: Const.kBlackShade1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: Const.kBorderContainer),
            Padding(
              padding: EdgeInsets.all(10.h.w),
              child: Row(
                children: [
                  Text('Precio:',
                      style: Const.medium.copyWith(fontSize: 11.sp)),
                  SizedBox(width: 5.w),
                  Text('\$15.000',
                      style: Const.medium.copyWith(
                          fontSize: 22.sp, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(8.h.w),
                    decoration: BoxDecoration(
                        color: taskColor!.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16.r)),
                    alignment: Alignment.center,
                    child: Text(taskTitle!,
                        style: Const.medium.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: taskColor)),
                  ),
                  SizedBox(width: 15.w),
                  GestureDetector(
                      onTap: onTap,
                      child: Icon(Icons.more_horiz_rounded, size: 30.h.w))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future showBottomSheetWidget(BuildContext context,
    {double height = 0.0, List<Widget> children = const <Widget>[]}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.all(20.h.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Opciones de tarea',
                  style: Const.medium
                      .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(children: children)
          ],
        ),
      ),
    ),
  );
}

Widget listTileWidget(
  BuildContext context, {
  void Function()? onTap,
  String title = '',
}) {
  return ListTile(
    onTap: onTap,
    splashColor: Colors.transparent,
    title: Text(title,
        style: Const.medium
            .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500)),
    contentPadding: const EdgeInsets.all(0),
  );
}

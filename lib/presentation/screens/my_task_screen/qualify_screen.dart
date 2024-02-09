import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../../application/constants.dart';
import '../../router/routes.dart';
import '../profile_screen/my_datas_screen/my_datas_screen_widget.dart';

class QualifyScreen extends StatefulWidget {
  bool isTrue;

  QualifyScreen({super.key, required this.isTrue});

  @override
  State<QualifyScreen> createState() => _QualifyScreenState();
}

class _QualifyScreenState extends State<QualifyScreen> {
  TextEditingController txtReview = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      appBar: AppBar(
        leading: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: Const.kBlack)),
          SizedBox(width: 10.w)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.h.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(radius: 60.r)),
              SizedBox(height: 20.h),
              Text('Comparte tu experiencia del trabajo hecho por Carla G.',
                  textAlign: TextAlign.center,
                  style: Const.medium
                      .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
              SizedBox(height: 43.h),
              Align(
                alignment: Alignment.center,
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  glow: false,
                  itemPadding: EdgeInsets.symmetric(horizontal: 5.w),
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(Icons.star_rounded,
                      color: Const.kOrangeShade2),
                  onRatingUpdate: (rating) {},
                ),
              ),
              SizedBox(height: 50.h),
              Text('Escribe una reseña pública',
                  style: Const.medium
                      .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w700)),
              SizedBox(height: 12.h),
              Text('Ayuda a los demás a saber sobre tu experiencia,',
                  style: Const.medium.copyWith(fontSize: 15.sp)),
              SizedBox(height: 24.h),
              CustomTextFormField(
                controller: txtReview,
                hint: 'Escribe tu reseña...',
                maxLines: 5,
                fillColor: Const.kProgressBorder,
                borderColor: Const.kBlackShade3,
                topPadding: 30.h,
              ),
              SizedBox(height: 70.h),
              CustomButton(
                  onTap: () => Navigator.pushNamed(
                      context,
                      arguments: widget.isTrue,
                      AppRouter.successScreen3),
                  title: 'Enviar'),
            ],
          ),
        ),
      ),
    );
  }
}

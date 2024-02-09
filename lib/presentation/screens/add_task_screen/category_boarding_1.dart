import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/presentation/router/routes.dart';

import '../../../application/constants.dart';
import '../../shared_widget/custom_button.dart';
import '../profile_screen/my_datas_screen/my_datas_screen_widget.dart';

class CategoryBoarding1Screen extends StatelessWidget {
  CategoryBoarding1Screen(
      {super.key,
      required this.pageController,
      this.isSummary = false,
      required this.selectedInd});
  final PageController pageController;
  final int selectedInd;
  final bool isSummary;
  TextEditingController txtTitle = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            color: Const.kWhite,
            padding: EdgeInsets.all(20.h.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('¿En qué necesitas ayuda?',
                    style: Const.bold.copyWith(fontSize: 30.sp)),
                SizedBox(height: 15.h),
                Text(
                    'Indica el título de solicitud. Intenta que sea preciso y conciso.',
                    style: Const.medium.copyWith(fontSize: 15.sp)),
                SizedBox(height: 20.h),
                Text('Título de solicitud',
                    style: Const.medium.copyWith(
                        fontSize: 13.sp, fontWeight: FontWeight.w600)),
                SizedBox(height: 5.h),
                CustomTextFormField(
                  controller: txtTitle,
                  validator: (p0) {
                    if (p0?.isEmpty ?? false) {
                      return "Por favor ingrese el título";
                    }
                    return null;
                  },
                  hint: 'Ej: Desarrollo web o reparación de laptop',
                  maxLines: 3,
                  maxLength: 80,
                  topPadding: 30.h,
                  hintColor: Const.kHint,
                ),
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
              child: CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (isSummary) {
                        payloadObj.removeWhere((key, value) => key == "title");
                        payloadObj.addEntries({"title": txtTitle.text}.entries);
                        Navigator.pushReplacementNamed(
                            context, AppRouter.taskSummaryScreen);
                      } else {
                        payloadObj.addEntries({"title": txtTitle.text}.entries);
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                    }
                  },
                  title: 'Continuar'),
            ),
          ),
        ],
      ),
    );
  }
}

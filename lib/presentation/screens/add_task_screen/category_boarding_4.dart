import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/screens/add_task_screen/widget.dart';
import 'package:itasker/presentation/shared_widget/custom_button.dart';

import '../../../application/constants.dart';
import '../../../gen/assets.gen.dart';
import '../profile_screen/my_datas_screen/my_datas_screen_widget.dart';

class CategoryBoarding4Screen extends StatefulWidget {
  const CategoryBoarding4Screen(
      {super.key,
      required this.pageController,
      this.isSummary = false,
      required this.selectedInd});
  final PageController pageController;
  final int selectedInd;
  final bool isSummary;

  @override
  State<CategoryBoarding4Screen> createState() =>
      _CategoryBoarding4ScreenState();
}

class _CategoryBoarding4ScreenState extends State<CategoryBoarding4Screen> {
  TextEditingController txtDetails = TextEditingController();
  File? fileimage;
  List<File> multiImage = [];
  final _formKey = GlobalKey<FormState>();

  void pickMultiImageFromGallary() async {
    multiImage.clear();
    ImagePicker pickImage = ImagePicker();
    List<XFile> images = await pickImage.pickMultiImage();

    if (images.isEmpty) {
      return;
    } else {
      for (var xImage in images) {
        setState(() {
          multiImage.add(File(xImage.path));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Const.kWhite,
              padding: EdgeInsets.all(20.h.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Entrega detalles de la solicitud',
                      style: Const.bold.copyWith(fontSize: 30.sp)),
                  SizedBox(height: 15.h),
                  Text(
                      'Indica detalles y sube imágenes que ayuden a entender mejor tu solicitud.',
                      style: Const.medium.copyWith(fontSize: 15.sp)),
                  SizedBox(height: 20.h),
                  Text('Detalles de solicitud',
                      style: Const.medium.copyWith(
                          fontSize: 13.sp, fontWeight: FontWeight.w600)),
                  SizedBox(height: 5.h),
                  CustomTextFormField(
                    validator: (p0) {
                      if (p0?.isEmpty ?? false) {
                        return "Please Enter Title";
                      }
                      return null;
                    },
                    controller: txtDetails,
                    hint:
                        'Ej: Necesito que reparen la ventilación de mi laptop modelo ASUS g14 y que cambien la pasta térmica la procesador. Yo no cuento con ninguna herramienta.',
                    maxLines: 6,
                    maxLength: 255,
                    topPadding: 30.h,
                    hintColor: Const.kHint,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              color: Const.kWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, left: 20.w),
                    child: Text('Sube imágenes (Máximo 5)',
                        style: Const.medium.copyWith(
                            fontSize: 17.sp, fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: 15.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 20.w),
                        GestureDetector(
                          onTap: () {
                            pickMultiImageFromGallary();
                            setState(() {});
                          },
                          child: DashedRect(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.svg.addImage.svg(),
                                SizedBox(height: 10.h),
                                Text('Subir imagen',
                                    style: Const.medium.copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Const.kBlackShade6))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        SizedBox(
                          height: 140.h,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: multiImage.length,
                              itemBuilder: (context, index) => Container(
                                    height: 140.h,
                                    width: 140.w,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    decoration: BoxDecoration(
                                      color: Const.kScaffoldBackground,
                                      borderRadius: BorderRadius.circular(5.r),
                                      image: DecorationImage(
                                        image: FileImage(multiImage[index])
                                            as ImageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )),
                        ),
                        SizedBox(width: 20.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            // const Spacer(),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                child: CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (multiImage.isEmpty) {
                          showMessage("Por favor seleccione imágenes", context);
                        } else {
                          payloadObj
                              .addEntries({"details": txtDetails.text}.entries);
                          payloadObj.addEntries({"images": multiImage}.entries);
                          if (widget.isSummary) {
                            Navigator.pushReplacementNamed(
                                context, AppRouter.taskSummaryScreen);
                          } else {
                            widget.pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          }
                        }
                      }
                    },
                    title: 'Continuar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

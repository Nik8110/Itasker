import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/gen/assets.gen.dart';

import '../../../router/routes.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(
        context,
        AppRouter.myDatasScreen,
      ),
      child: Scaffold(
        backgroundColor: Const.kBackground,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                  child: Assets.images.passwordSuccess
                      .svg(height: 110.h, width: 110.w)),
              SizedBox(height: 40.h),
              Text('Correo actualizado',
                  style: Const.bold.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      color: Const.kWhite)),
              SizedBox(height: 20.h),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text('Tu correo fue actualizado con éxito',
                    textAlign: TextAlign.center,
                    style: Const.medium.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.normal,
                        color: Const.kWhite)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

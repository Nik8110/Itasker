import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/constants.dart';
import '../../router/routes.dart';

class DipositNowScreen extends StatelessWidget {
  const DipositNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRouter.inProgressScreen),
      child: Scaffold(
        backgroundColor: Const.kScaffoldBackground,
        body: Center(
          child: Text(
              ''
              'Pasarella de\nMercado Pago',
              textAlign: TextAlign.center,
              style: Const.medium
                  .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}

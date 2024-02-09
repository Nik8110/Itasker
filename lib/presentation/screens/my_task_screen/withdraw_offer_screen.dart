import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/constants.dart';
import '../../router/routes.dart';
import '../../shared_widget/custom_button.dart';
import '../../shared_widget/custom_radio_bution.dart';

class WithDrawOfferScreen extends StatefulWidget {
  const WithDrawOfferScreen({super.key});

  @override
  State<WithDrawOfferScreen> createState() => _WithDrawOfferScreenState();
}

class _WithDrawOfferScreenState extends State<WithDrawOfferScreen> {
  String groupValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: appBarWidget(
        context,
        title: 'Retirar mi oferta',
        backgroundColor: Const.kWhite,
        iconColor: Const.kBlack,
        textColor: Const.kBlack,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.h.w),
            color: Const.kWhite,
            child: Column(
              children: [
                Text('¿Porqué deseas retirar tu oferta?',
                    style: Const.medium.copyWith(
                        fontSize: 22.sp, fontWeight: FontWeight.w700)),
                SizedBox(height: 20.h),
                MyRadioListTile(
                    title: 'Alternativa 1',
                    value: 'Alternativa 1',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value.toString();
                      });
                    }),
                MyRadioListTile(
                    title: 'Alternativa 2',
                    value: 'Alternativa 2',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value.toString();
                      });
                    }),
                MyRadioListTile(
                    title: 'Alternativa 3',
                    value: 'Alternativa 3',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value.toString();
                      });
                    }),
                MyRadioListTile(
                    title: 'Alternativa 4',
                    value: 'Alternativa 4',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value.toString();
                      });
                    }),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(20.h.w),
            child: CustomButton(
              onTap: () {
                confirmBottomWidget(
                  context,
                  height: 230.h,
                  title: 'Estás seguro de retirar?',
                  desc:
                      'Si retiras tu oferta, el ofertante no podrá visualizar tu oferta y no podrás volver a ofertar en esta tarea.',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouter.landingScreen,
                      (route) => false,
                    );
                  },
                );
              },
              title: 'Confirmar',
            ),
          ),
        ],
      ),
    );
  }
}

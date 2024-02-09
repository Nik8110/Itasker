import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/application/constants.dart';

class TermsCcnditionDataPolicyScreen extends StatefulWidget {
  String title, desc;

  TermsCcnditionDataPolicyScreen(
      {super.key, required this.title, required this.desc});

  @override
  State<TermsCcnditionDataPolicyScreen> createState() =>
      _TermsCcnditionDataPolicyScreenState();
}

class _TermsCcnditionDataPolicyScreenState
    extends State<TermsCcnditionDataPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, title: widget.title),
      body: Center(
        child: Text(
          widget.desc,
          textAlign: TextAlign.center,
          style: Const.medium
              .copyWith(fontSize: 23.sp, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

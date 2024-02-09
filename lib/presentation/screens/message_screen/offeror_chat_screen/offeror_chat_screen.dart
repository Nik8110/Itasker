import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../application/constants.dart';
import '../../../router/routes.dart';

class OfferorChatScreen extends StatefulWidget {
  const OfferorChatScreen({super.key});

  @override
  State<OfferorChatScreen> createState() => _OfferorChatScreenState();
}

class _OfferorChatScreenState extends State<OfferorChatScreen> {
  TextEditingController txtMessage = TextEditingController();

  List<Map> sendData = [];
  List<Map> receiveData = [];
  bool isMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kWhite,
      appBar: AppBar(
        backgroundColor: Const.kBackground,
        elevation: 0,
        leading: const Text(''),
        leadingWidth: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Container(
              height: 40.h,
              width: 40.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Const.kWhite),
            ),
            SizedBox(width: 10.w),
            Text(
              'Carla G.',
              style: Const.medium.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: Const.kWhite,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(
                  context, AppRouter.offerorChatBudgetScreen),
              icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    height: 95.h,
                    width: 332.w,
                    decoration: BoxDecoration(
                        color: Const.kBlueShad1,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Const.kBorderContainer)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¡Tarea En Progreso!',
                          style: Const.medium.copyWith(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            color: Const.kBlueShad2,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Se ha habilitado el chat para que puedan\nponerse de acuerdo y concretar la solicitud.',
                          textAlign: TextAlign.center,
                          style: Const.medium.copyWith(fontSize: 13.sp),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sendData.length,
                    itemBuilder: (context, index) => Align(
                      alignment: (sendData[index]['isSender']
                          ? Alignment.topRight
                          : Alignment.topLeft),
                      child: Container(
                        margin: sendData[index]['isSender']
                            ? EdgeInsets.only(
                                left: 80.w, right: 10.w, bottom: 5.h)
                            : EdgeInsets.only(
                                left: 10.w, right: 80.w, bottom: 5.h),
                        padding: EdgeInsets.all(10.h.w),
                        decoration: BoxDecoration(
                          borderRadius: sendData[index]['isSender']
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  bottomLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                )
                              : BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  bottomRight: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                ),
                          color: sendData[index]['isSender']
                              ? Const.kBackground
                              : Const.kProgressBorder,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${sendData[index]['text']}          ',
                              style: sendData[index]['isSender']
                                  ? Const.medium.copyWith(
                                      fontSize: 15.sp, color: Const.kWhite)
                                  : Const.medium.copyWith(
                                      fontSize: 15.sp, color: Const.kBlack),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              sendData[index]['time'],
                              style: sendData[index]['isSender']
                                  ? Const.medium.copyWith(
                                      fontSize: 11.sp,
                                      color: Const.kWhite.withOpacity(0.8))
                                  : Const.medium.copyWith(
                                      fontSize: 11.sp,
                                      color: Const.kBlack.withOpacity(0.8)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 65.h),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 65.h,
              decoration: BoxDecoration(
                  color: Const.kWhite,
                  border: Border.all(color: Const.kBorderContainer)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.photo,
                          color: Const.kBlackShade4, size: 30.r)),
                  Flexible(
                    child: TextFormField(
                      controller: txtMessage,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mensaje',
                          hintStyle: Const.medium
                              .copyWith(fontSize: 17.sp, color: Colors.grey)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        sendData.addAll([
                          {
                            'text': txtMessage.text,
                            'time':
                                '${DateTime.now().hour}:${DateTime.now().minute} AM',
                            'isSender': true
                          }
                        ]);
                        txtMessage.clear();
                        setState(() {});
                      },
                      icon: Icon(Icons.send,
                          size: 28.r, color: Const.kBackground))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

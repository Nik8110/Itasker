import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:location/location.dart';

import '../../../application/constants.dart';
import '../../../gen/assets.gen.dart';
import '../../shared_widget/custom_button.dart';

class CategoryBoarding3Screen extends StatefulWidget {
  const CategoryBoarding3Screen(
      {super.key,
      required this.pageController,
      this.isSummary = false,
      required this.selectedInd});
  final PageController pageController;
  final int selectedInd;
  final bool isSummary;

  @override
  State<CategoryBoarding3Screen> createState() =>
      _CategoryBoarding3ScreenState();
}

class _CategoryBoarding3ScreenState extends State<CategoryBoarding3Screen> {
  GoogleMapController? googleMapController;
  List<Marker> markers = [];
  Location location = Location();

  List<LatLng> positions = <LatLng>[
    const LatLng(21.1702, 72.8311),
  ];

  final Completer<GoogleMapController> completer = Completer();

  Future<void> _getCurrentLocation() async {
    try {
      final userLocation = await location.getLocation();
      googleMapController!.animateCamera(
        CameraUpdate.newLatLng(
            LatLng(userLocation.latitude!, userLocation.longitude!)),
      );
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    googleMapController = controller;
    if (!completer.isCompleted) {
      _getCurrentLocation();
      completer.complete(controller);
    }
    setState(() {});
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Const.kWhite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.h.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Marca un punto de referencia',
                    style: Const.bold.copyWith(fontSize: 30.sp)),
                SizedBox(height: 15.h),
                Text(
                    'Tu dirección no será visible para los demás. Solo ajustaremos la región de búsqueda.',
                    style: Const.medium.copyWith(fontSize: 15.sp)),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Stack(
              children: [
                SizedBox(
                  height: 400.h,
                  child: GoogleMap(
                    fortyFiveDegreeImageryEnabled: true,
                    myLocationButtonEnabled: false,
                    gestureRecognizers: {
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      )
                    },
                    mapToolbarEnabled: false,
                    onMapCreated: onMapCreated,
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(21.1702, 72.8311), zoom: 10),
                    markers: markers.toSet(),
                    myLocationEnabled: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 0),
                  child: SizedBox(
                    height: 40.h,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Buscar',
                        fillColor: Const.kWhite,
                        filled: true,
                        contentPadding: EdgeInsets.only(top: 5.h),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10.h.w),
                          child: Assets.svg.search.svg(),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Const.kBorderContainer),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Const.kBorderContainer),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        hintStyle: Const.medium
                            .copyWith(fontSize: 15.sp, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Assets.svg.location.svg(),
                SizedBox(width: 10.w),
                Flexible(
                  child: Text('Av. Dos de Mayo 1498, San Isidro 15073',
                      style: Const.medium.copyWith(fontSize: 15.sp)),
                )
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
                    if (widget.isSummary) {
                      Navigator.pushReplacementNamed(
                          context, AppRouter.taskSummaryScreen);
                    } else {
                      payloadObj.addEntries({
                        "address": "Av. Dos de Mayo 1498, San Isidro 15073"
                      }.entries);
                      widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
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

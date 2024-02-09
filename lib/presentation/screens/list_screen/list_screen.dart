import 'dart:async';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart' as g;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:itasker/application/constants.dart';
import 'package:itasker/presentation/router/routes.dart';
import 'package:itasker/presentation/screens/list_screen/list_screen_widget.dart';
import 'package:itasker/presentation/shared_widget/custom_radio_bution.dart';
import 'package:location/location.dart';

import '../../../application/string.dart';
import '../../../gen/assets.gen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String groupValue = '';
  bool isChecked = false;
  bool isMap = false;
  bool isShowDialog = false;

  List<Map> categoryData = [
    {'title': Strings.maestranza, 'isChecked': false},
    {'title': Strings.animals, 'isChecked': false},
    {'title': Strings.gardening, 'isChecked': false},
    {'title': Strings.cleaning, 'isChecked': false},
    {'title': Strings.technology, 'isChecked': false},
    {'title': Strings.aid, 'isChecked': false},
    {'title': Strings.sales, 'isChecked': false},
    {'title': Strings.beautyCarePersonal, 'isChecked': false},
    {'title': Strings.transportation, 'isChecked': false},
    {'title': Strings.meal, 'isChecked': false},
    {'title': Strings.online, 'isChecked': false},
    {'title': Strings.others, 'isChecked': false},
  ];
  GoogleMapController? googleMapController;
  List<Marker> markers = [];
  Location location = Location();
  List<Map> assets = <Map>[
    {
      "image": 'assets/images/technology.png',
      "color": Const.kGreenAccentLigth,
      'lat': LatLng(21.1702, 72.8311)
    },
    {
      "image": 'assets/images/animals.png',
      "color": Const.kBlueLight,
      'lat': LatLng(21.1888, 72.8404)
    },
    {
      "image": 'assets/images/aid.png',
      "color": Const.kYellowAccentLigth,
      'lat': LatLng(21.1905, 72.8100)
    },
    {
      "image": 'assets/images/sales.png',
      "color": Const.kindigoLight,
      'lat': LatLng(21.2087, 72.8311)
    },
    {
      "image": 'assets/images/technology.png',
      "color": Const.kGreenAccentLigth,
      'lat': LatLng(21.2032, 72.8662)
    },
  ];

  final Completer<GoogleMapController> completer = Completer();

  Future<g.Position> getUserCurrentLocation() async {
    await g.Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await g.Geolocator.requestPermission();
    });
    return await g.Geolocator.getCurrentPosition();
  }

  void _currentLocation() async {
    final userLocation = await location.getLocation();

    final GoogleMapController? controller = await googleMapController;
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
    } on Exception {}
    controller?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(userLocation.latitude!, userLocation.longitude!),
        zoom: 17.0,
      ),
    ));
  }

  Future<void> _getCurrentLocation() async {
    try {
      getMarker();
      final userLocation = await location.getLocation();
      googleMapController!.animateCamera(
        CameraUpdate.newLatLng(
            LatLng(userLocation.latitude!, userLocation.longitude!)),
      );
    } catch (e) {}
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

  getMarker() async {
    for (var i = 0; i < assets.length; i++) {
      final marker1 = await _buildMarkers(
        assetPath: assets[i]['image'],
        backgroundColor: assets[i]['color'],
        markerId: i.toString(),
        position: assets[i]['lat'],
        onTap: () {
          setState(() {
            isShowDialog = !isShowDialog;
            getMarker();
          });
        },
        borderColor: isShowDialog ? Const.kBlue : Colors.transparent,
      );
      markers.add(marker1);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: SafeArea(
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Text('Filtros',
                          style: Const.medium.copyWith(
                              fontSize: 17.sp, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text('Limpiar filtros',
                            style: Const.medium.copyWith(
                                fontSize: 15.sp, color: Const.kBlueShad2)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Text('Ordenar por:',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    children: [
                      MyRadioListTile(
                          title: 'Cercanía',
                          value: 'Cercanía',
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value.toString();
                            });
                          }),
                      MyRadioListTile(
                          title: 'Fecha de solicitud',
                          value: 'Fecha de solicitud',
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value.toString();
                            });
                          }),
                      MyRadioListTile(
                          title: 'Precio menor',
                          value: 'Precio menor',
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value.toString();
                            });
                          }),
                      MyRadioListTile(
                          title: 'Precio mayor',
                          value: 'Precio mayor',
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value.toString();
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                const Divider(color: Const.kBorderContainer, thickness: 1.5),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text('Elegir categoría',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 20.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categoryData.length,
                  itemBuilder: (context, index) => CheckBoxWidget(
                      value: categoryData[index]['isChecked'],
                      onChanged: (value) {
                        setState(() {
                          categoryData[index]['isChecked'] = value!;
                        });
                      },
                      title: categoryData[index]['title']),
                ),
                const Divider(color: Const.kBorderContainer, thickness: 1.5),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text('Elige Comuna',
                      style: Const.medium.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 20.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AppRouter.filterScreen);
                      },
                      child: Container(
                        height: 46.h,
                        padding: EdgeInsets.all(13.h.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: Const.kBorderContainer)),
                        child: Row(
                          children: [
                            Text('Varios',
                                style: Const.medium.copyWith(
                                    fontSize: 17.sp,
                                    color: Const.kBlackShade9)),
                            const Spacer(),
                            const Icon(Icons.keyboard_arrow_down_rounded,
                                color: Const.kBlackShade3)
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 20.h),
                const Divider(color: Const.kBorderContainer, thickness: 1.5),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Text('Solicitudes de hoy',
                          style: Const.medium.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      CupertinoSwitch(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                        activeColor: Const.kBlue,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Const.kScaffoldBackground,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Const.kWhite,
        elevation: 0,
        leading: null,
        leadingWidth: 0,
        title: SizedBox(
          height: 40.h,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Buscar',
              contentPadding: EdgeInsets.only(top: 5.h),
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.h.w),
                child: Assets.svg.search.svg(),
              ),
              suffixIcon: GestureDetector(
                onTap: () => scaffoldKey.currentState!.openEndDrawer(),
                child: Padding(
                    padding: EdgeInsets.all(10.h.w),
                    child: Assets.svg.drawer.svg()),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Const.kBorderContainer),
                borderRadius: BorderRadius.circular(20.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Const.kBorderContainer),
                borderRadius: BorderRadius.circular(20.r),
              ),
              hintStyle:
                  Const.medium.copyWith(fontSize: 15.sp, color: Colors.grey),
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isMap = !isMap;
                    });
                  },
                  child: isMap
                      ? Assets.svg.map.svg(height: 26.h, width: 26.w)
                      : Assets.images.list.image(height: 26.h, width: 26.w)),
              SizedBox(width: 15.w),
              GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, AppRouter.notificationScreen),
                  child:
                      Assets.svg.notification.svg(height: 26.h, width: 26.w)),
              SizedBox(width: 15.w),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: isMap
          ? FloatingActionButton.small(
              onPressed: _currentLocation,
              backgroundColor: Colors.white,
              child: const Icon(Icons.gps_fixed_rounded, color: Colors.black),
            )
          : const SizedBox.shrink(),
      body: isMap
          ? Stack(
              children: [
                GoogleMap(
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
                  myLocationEnabled: true,
                ),
                if (isShowDialog)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.24,
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              arguments: {'text': 'Preguntar', 'isShow': false},
                              context,
                              AppRouter.taskerChatBudgetScreen),
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 13.w),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.h.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 12.r,
                                            backgroundColor: Const.kBlueLight,
                                            child: Assets.images.animals
                                                .image(scale: 6),
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                              'Transcribir documento al español',
                                              style: Const.medium.copyWith(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non leo a nisl iaculis gravida in eget leo a',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: Const.medium.copyWith(
                                              fontSize: 13.sp,
                                              color: Const.kBlackShade1)),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined,
                                              color: Const.kBackground,
                                              size: 16.r),
                                          SizedBox(width: 5.w),
                                          Text(
                                            'Santiago Centro, Santiago, Chile',
                                            style: Const.medium.copyWith(
                                                fontSize: 11.sp,
                                                color: Const.kBlackShade1),
                                          ),
                                          SizedBox(width: 5.w),
                                          SizedBox(
                                            height: 14.h,
                                            child: const VerticalDivider(
                                                color: Const.kBorderContainer),
                                          ),
                                          Icon(Icons.access_time_filled_rounded,
                                              color: Const.kBlackShade1,
                                              size: 16.h.w),
                                          SizedBox(width: 5.w),
                                          Text(
                                            'Hoy, 07:51 PM',
                                            style: Const.medium.copyWith(
                                                fontSize: 11.sp,
                                                color: Const.kBlackShade1),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                    color: Const.kBorderContainer,
                                    thickness: 1),
                                Padding(
                                  padding: EdgeInsets.all(10.h.w),
                                  child: Row(
                                    children: [
                                      Text('Precio:',
                                          style: Const.medium
                                              .copyWith(fontSize: 11.sp)),
                                      SizedBox(width: 5.w),
                                      Text('\$15.000',
                                          style: Const.medium.copyWith(
                                              fontSize: 22.sp,
                                              fontWeight: FontWeight.w600)),
                                      const Spacer(),
                                      Container(
                                        height: 30.h,
                                        width: 30.w,
                                        decoration: const BoxDecoration(
                                            color: Const.kBackground,
                                            shape: BoxShape.circle),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text('Pedro V.',
                                          style: Const.medium.copyWith(
                                              fontSize: 13.sp,
                                              color: Const.kBlackShade7)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            )
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        arguments: {'text': 'Preguntar', 'isShow': false},
                        context,
                        AppRouter.taskerChatBudgetScreen),
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 13.w),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.h.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 12.r,
                                      backgroundColor: Const.kBlueLight,
                                      child:
                                          Assets.images.animals.image(scale: 6),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text('Transcribir documento al español',
                                        style: Const.medium.copyWith(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non leo a nisl iaculis gravida in eget leo a',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Const.medium.copyWith(
                                        fontSize: 13.sp,
                                        color: Const.kBlackShade1)),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                        color: Const.kBackground, size: 16.r),
                                    SizedBox(width: 5.w),
                                    Text(
                                      'Santiago Centro, Santiago, Chile',
                                      style: Const.medium.copyWith(
                                          fontSize: 11.sp,
                                          color: Const.kBlackShade1),
                                    ),
                                    SizedBox(width: 5.w),
                                    SizedBox(
                                      height: 14.h,
                                      child: const VerticalDivider(
                                          color: Const.kBorderContainer),
                                    ),
                                    Icon(Icons.access_time_filled_rounded,
                                        color: Const.kBlackShade1,
                                        size: 16.h.w),
                                    SizedBox(width: 5.w),
                                    Text(
                                      'Hoy, 07:51 PM',
                                      style: Const.medium.copyWith(
                                          fontSize: 11.sp,
                                          color: Const.kBlackShade1),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                              color: Const.kBorderContainer, thickness: 1),
                          Padding(
                            padding: EdgeInsets.all(10.h.w),
                            child: Row(
                              children: [
                                Text('Precio:',
                                    style:
                                        Const.medium.copyWith(fontSize: 11.sp)),
                                SizedBox(width: 5.w),
                                Text('\$15.000',
                                    style: Const.medium.copyWith(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w600)),
                                const Spacer(),
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: const BoxDecoration(
                                      color: Const.kBackground,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(width: 10.w),
                                Text('Pedro V.',
                                    style: Const.medium.copyWith(
                                        fontSize: 13.sp,
                                        color: Const.kBlackShade7)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
    );
  }

  Future<Marker> _buildMarkers({
    required String assetPath,
    required Color backgroundColor,
    required Color borderColor,
    required String markerId,
    required LatLng position,
    void Function()? onTap,
  }) async {
    BitmapDescriptor data =
        await _buildCustomMarker(assetPath, backgroundColor, borderColor);
    return Marker(
      onTap: onTap,
      markerId: MarkerId(markerId),
      position: position,
      icon: data,
    );
  }

  Future<BitmapDescriptor> _buildCustomMarker(
    String assetPath,
    Color backgroundColor,
    Color borderColor,
  ) async {
    final ByteData byteData = await rootBundle.load(assetPath);
    final List<int> bytes = byteData.buffer.asUint8List();

    const double desiredWidth = 50;
    const double desiredHeight = 50;

    const double scaleFactor = desiredWidth / 100.0;

    const double totalWidth = desiredWidth + 20 * 2;
    const double totalHeight = desiredHeight + 20 * 2;

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(
      pictureRecorder,
      Rect.fromPoints(
        const Offset(0.0, 0.0),
        const Offset(totalWidth, totalHeight),
      ),
    );

    final Paint backgroundPaint = Paint()..color = backgroundColor;
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    const double borderWidth = desiredWidth + 40;
    const double borderHeight = desiredHeight + 40;
    const double borderRadius = (desiredWidth / 50) + 40;
    const Offset borderCenter = Offset(borderWidth / 2, borderHeight / 2);

    const double radius = (desiredWidth / 2) + 12;
    const Offset center = Offset(totalWidth / 2, totalHeight / 2);

    final Codec codec = await instantiateImageCodec(Uint8List.fromList(bytes));
    final FrameInfo frameInfo = await codec.getNextFrame();

    final double imageX =
        center.dx - (frameInfo.image.width * scaleFactor) / 1.6;
    final double imageY =
        center.dy - (frameInfo.image.height * scaleFactor) / 1.6;

    canvas.drawCircle(borderCenter, borderRadius, borderPaint);
    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawImageRect(
      frameInfo.image,
      Rect.fromLTRB(0, 0, frameInfo.image.width.toDouble(),
          frameInfo.image.height.toDouble()),
      Rect.fromLTRB(
          imageX, imageY, imageX + desiredWidth, imageY + desiredHeight),
      Paint(),
    );

    final img = pictureRecorder.endRecording();
    final imgByteData =
        await img.toImage(totalWidth.toInt(), totalHeight.toInt());
    final imgUint8List =
        await imgByteData.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(imgUint8List!.buffer.asUint8List());
  }
}

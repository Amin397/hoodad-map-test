import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Utils/routs_utils.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/Utils/view_utils.dart';

class SetRoutController extends GetxController {
  TextEditingController originTextController = TextEditingController();
  TextEditingController destinationTextController = TextEditingController();

  List<Location> originLocation = [];
  List<Location> destinationLocation = [];
  List<LatLng> routPoints = [];

  Marker? originMarker;
  Marker? destinationMarker;

  MapController mapController = MapController();

  bool isOrigin = true;
  LatLng? originPoint;
  LatLng? destinationPoint;

  late LatLng originLatLng;
  late LatLng destinationLatLng;

  RxBool isVisible = false.obs;

  void goToMap() async {
    originLocation.clear();
    destinationLocation.clear();
    isVisible(false);

    // originLocation = await locationFromAddress(originTextController.text);
    // destinationLocation =
    //     await locationFromAddress(destinationTextController.text);

    // originLatLng =
    //     LatLng(originLocation.first.latitude, originLocation.first.longitude);
    // destinationLatLng = LatLng(destinationLocation.first.latitude,
    //     destinationLocation.first.longitude);

    await makeRoutRequest();
  }

  Future<void> makeRoutRequest() async {

    showLoadingAlert();
    Uri url = Uri.parse(
        // 'http://router.project-osrm.org/route/v1/driving/${originLatLng.longitude},${originLatLng.latitude};${destinationLatLng.longitude},${destinationLatLng.latitude}?steps=true&annotations=true&geometries=geojson&overview=full');
        'http://router.project-osrm.org/route/v1/driving/${originPoint!.longitude},${originPoint!.latitude};${destinationPoint!.longitude},${destinationPoint!.latitude}?steps=true&annotations=true&geometries=geojson');

    http.Response response = await http.get(url);

    // print(response.body);
    print('\n\n ============== \n\n');

    routPoints = [];

    List router =
        jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];

    String amin = router.first.toString();

    amin = amin.replaceAll(']', '').replaceAll('[', '').replaceAll(' ', '');

    print(amin.split(','));

    // Tajrish, Iran

    //Tehran Province, Tajrish, Yekta, RC4C+HJH, Iran

    //
    for (var o in router) {
      String reep = o.toString();
      reep = reep.replaceAll(']', '').replaceAll('[', '').replaceAll(' ', '');

      var lat1 = reep.split(',');
      var lng1 = reep.split(",");

      print('$lat1/$lng1');

      routPoints.add(
        LatLng(
          double.parse(lat1[1]),
          double.parse(lng1[0]),
        ),
      );
    }
    isVisible(true);
    Get.back();
    Future.delayed(const Duration(seconds: 1), () {
      update(['routPoints']);
    });
    // arrowline
  }

  void addMarkerToMap({required LatLng pressedPoint}) async {

    if (isOrigin) {
      routPoints.clear();
      destinationMarker = null;
      originMarker = Marker(
        point: pressedPoint,
        child: const Icon(
          Icons.location_on,
          color: Colors.blue,
          size: 30.0,
          semanticLabel: 'مبدا',
        ),
        alignment: Alignment.topCenter,

      );
      originPoint = pressedPoint;
      isOrigin = false;
    } else {
      destinationMarker = Marker(
        point: pressedPoint,
        child: const Icon(
          Icons.location_on,
          color: Colors.green,
          size: 30.0,
          semanticLabel: 'مقصد',
        ),
        alignment: Alignment.topCenter,
      );
      destinationPoint = pressedPoint;
      isOrigin = true;
      await makeRoutRequest();
    }



    update(['routPoints']);
  }
}

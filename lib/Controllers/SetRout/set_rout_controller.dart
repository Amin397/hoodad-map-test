import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/Utils/view_utils.dart';

class SetRoutController extends GetxController {
  TextEditingController originTextController = TextEditingController();
  TextEditingController destinationTextController = TextEditingController();

  List<Location> originLocation = [];
  List<Location> destinationLocation = [];
  List<LatLng> routPoints = [];
  List<Marker> markerList = [];

  Marker? originMarker;
  Marker? destinationMarker;

  MapController mapController = MapController();

  bool isOrigin = true;
  LatLng? originPoint;
  LatLng? destinationPoint;

  double markerRandomLat = 35.80723;
  double markerRandomLng = 51.42881;
  dynamic distanceInMeters = 0.0;
  String showDistance = '';

  late LatLng originLatLng;
  late LatLng destinationLatLng;

  RxBool isVisible = false.obs;

  Marker? currentLocation;

  @override
  void onInit() {
    updateLocation();
    super.onInit();
  }

  Future<void> updateLocation() async {
    if (await Permission.location.status.isGranted) {
      _getCurrentLocation();

    } else {
      await Permission.location.request();
      updateLocation();
    }
    // if (LocationPermission.whileInUse == LocationPermission.denied) {
    //   print('sdasdasd');
    // }
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      currentLocation = Marker(
        point: LatLng(
          position.latitude,
          position.longitude,
        ),
        child: const Icon(
          Icons.my_location_outlined,
          color: Colors.red,
        ),
        alignment: Alignment.topCenter
      );

      mapController.moveAndRotate(currentLocation!.point, 17, 3.0);
      Future.delayed(const Duration(milliseconds: 500) , (){
        update(['routPoints']);
      });

    }).catchError((e) {
      print(e);
    });
  }

  Future<void> makeRoutRequest() async {
    showLoadingAlert();
    Uri url = Uri.parse(
        // 'http://router.project-osrm.org/route/v1/driving/${originLatLng.longitude},${originLatLng.latitude};${destinationLatLng.longitude},${destinationLatLng.latitude}?steps=true&annotations=true&geometries=geojson&overview=full');
        'http://router.project-osrm.org/route/v1/driving/${originPoint!.longitude},${originPoint!.latitude};${destinationPoint!.longitude},${destinationPoint!.latitude}?steps=true&annotations=true&geometries=geojson');
    http.Response response = await http.get(url);
    routPoints = [];

    List router =
        jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];

    String amin = router.first.toString();

    amin = amin.replaceAll(']', '').replaceAll('[', '').replaceAll(' ', '');

    for (var o in router) {
      String reep = o.toString();
      reep = reep.replaceAll(']', '').replaceAll('[', '').replaceAll(' ', '');

      var lat1 = reep.split(',');
      var lng1 = reep.split(",");

      routPoints.add(
        LatLng(
          double.parse(lat1[1]),
          double.parse(lng1[0]),
        ),
      );
    }
    isVisible(true);
    Get.back();
    distanceInMeters = 0.0;
    calDistance();
    Future.delayed(const Duration(seconds: 1), () {
      update(['routPoints']);
    });
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

  void addRandomMarker() {
    double randomLat;
    double randomLng;

    randomLat = markerRandomLat + (Random().nextInt(1000).toDouble() / 100000);
    randomLng = markerRandomLng + (Random().nextInt(1000).toDouble() / 100000);

    print(randomLng);
    print(randomLat);

    markerList.insert(
      0,
      Marker(
        point: LatLng(randomLat, randomLng),
        height: 30.0,
        width: 30.0,
        child: Container(
          height: 30.0,
          width: 30.0,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        ),
      ),
    );

    update(['routPoints']);
  }

  void calDistance()async {

    int meters;

    print(routPoints.length);

    for(int i = 0; i <= routPoints.length ; i++){

      print(i);
      if(i < routPoints.length - 1){
        distanceInMeters = distanceInMeters + Geolocator.distanceBetween(
          routPoints[i].latitude,
          routPoints[i].longitude,
          routPoints[i + 1].latitude,
          routPoints[i + 1].longitude,
        );
      }
    }



    meters = distanceInMeters!.toInt();

    if(distanceInMeters!.toInt() > 1000){
      distanceInMeters = double.parse((distanceInMeters / 1000).toStringAsFixed(2));
    }else{
      distanceInMeters = distanceInMeters.toInt();
    }


    if(meters> 1000){
      showDistance = 'KM';
    }else{
      showDistance = 'M';
    }


    print(distanceInMeters);
    update(['routPoints']);

  }
}

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled1/Models/Home/task_model.dart';

class HomeController extends GetxController {
  List<Location> originLocation = [];
  List<Location> destinationLocation = [];
  List<LatLng> routPoints = [];

  MapController mapController = MapController();
  Marker? currentLocation;

  Marker? originMarker;
  Marker? destinationMarker;
  List<Marker> markerList = [];

  RxBool isFilterOn = false.obs;

  List<TaskModel> taskList = [
    TaskModel(
      id: 0,
      title: 'همه',
      isSelected: true.obs,
      alignment: Alignment.centerRight,
    ),
    TaskModel(
      id: 1,
      title: 'جابجایی',
      isSelected: false.obs,
      alignment: Alignment.center,
    ),
    TaskModel(
      id: 2,
      title: 'شارژ',
      isSelected: false.obs,
      alignment: Alignment.centerLeft,
    ),
  ];

  @override
  void onInit() {
    // updateLocation();
    super.onInit();
  }

  Future<void> updateLocation() async {
    if (await Permission.location.status.isGranted) {
      _getCurrentLocation();
    } else {
      await Permission.location.request();
      updateLocation();
    }
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
          alignment: Alignment.topCenter);

      mapController.moveAndRotate(currentLocation!.point, 17, 3.0);
      Future.delayed(const Duration(milliseconds: 500), () {
        update(['routPoints']);
      });
    }).catchError((e) {
      print(e);
    });
  }

  void switchFilterOn() {
    isFilterOn(!isFilterOn.value);
  }

  void selectTask({required TaskModel task}) {
    for (var o in taskList) {
      o.isSelected(false);
    }
    task.isSelected(true);

    Future.delayed(const Duration(milliseconds: 500) , (){
      isFilterOn(false);
    });
  }
}

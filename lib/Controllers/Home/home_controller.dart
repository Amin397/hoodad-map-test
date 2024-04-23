import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled1/Models/Home/task_model.dart';
import 'package:untitled1/Utils/routs_utils.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  List<Location> originLocation = [];
  List<Location> destinationLocation = [];
  List<LatLng> routPoints = [];

  MapController mapController = MapController();
  Marker? currentLocation;

  AnimationController? animationController;
  bool isPlaying = false;

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
    initData();
    super.onInit();
  }

  initData() async {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
    );
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
    isPlaying = !isPlaying;
    isPlaying
        ? animationController!.forward()
        : animationController!.reverse();
      if(isPlaying){
        isFilterOn(!isFilterOn.value);
        update(['filterSwitch']);
      }else{
        Future.delayed(const Duration(milliseconds: 300) , (){
          isFilterOn(!isFilterOn.value);
          update(['filterSwitch']);
        });
      }
    // });
  }

  void selectTask({required TaskModel task}) {
    for (var o in taskList) {
      o.isSelected(false);
    }
    task.isSelected(true);

    Future.delayed(const Duration(milliseconds: 500), () {
      switchFilterOn();
    });
  }

  void goToSearch() async {
    Get.toNamed(NameRouts.search);
  }

  void goToMenu() async {
    Get.toNamed(NameRouts.menu);
  }


  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
}

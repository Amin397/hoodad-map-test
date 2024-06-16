import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled1/Consts/error_code.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Models/Home/scooter_marker_model.dart';
import 'package:untitled1/Models/Home/task_model.dart';
import 'package:untitled1/Utils/API/project_requests_utils.dart';
import 'package:untitled1/Utils/routs_utils.dart';
import 'package:untitled1/Utils/view_utils.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  ProjectRequestsUtils request = ProjectRequestsUtils();
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
  RxBool isCollect = false.obs;

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
    await updateLocation();
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
    if (currentLocation is Marker) {
      mapController.moveAndRotate(currentLocation!.point, 17, 3.0);
    } else {
      Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true,
      ).then((Position position) async {
        currentLocation = Marker(
          point: LatLng(
            position.latitude,
            position.longitude,
          ),
          child: const Icon(
            Icons.my_location_outlined,
            color: Colors.red,
          ),
          alignment: Alignment.topCenter,
        );

        mapController.moveAndRotate(currentLocation!.point, 17, 3.0);
        await getScootersMarker();
        Future.delayed(const Duration(milliseconds: 500), () {
          update(['mapUpdate']);
        });
      }).catchError((e) {
        print(e);
      });
    }
  }

  void switchFilterOn() {
    isPlaying = !isPlaying;
    isPlaying ? animationController!.forward() : animationController!.reverse();
    if (isPlaying) {
      isFilterOn(!isFilterOn.value);
      update(['filterSwitch']);
    } else {
      Future.delayed(const Duration(milliseconds: 300), () {
        isFilterOn(!isFilterOn.value);
        update(['filterSwitch']);
      });
    }
    // });
  }

  void selectTask({required TaskModel task}) async {
    for (var o in taskList) {
      o.isSelected(false);
    }
    task.isSelected(true);

    await getScootersMarker(
      type: (task.id == 0) ? null : task.id,
    );

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

  Future<void> getScootersMarker({int? type}) async {
    showLoadingAlert();
    List<ScooterMarkerModel> tempList = [];
    request
        .getMapScooters(
      lat: currentLocation!.point.latitude.toString(),
      lng: currentLocation!.point.longitude.toString(),
      type: type,
    )
        .then(
      (value) {
        Get.back();
        Map<String, dynamic> apiResult = jsonDecode(value!.body);

        if (apiResult['errorCode'] == null) {
          tempList = ScooterMarkerModel.listFromJson(
            apiResult['result'],
          );

          print('tempList.length');
          print(tempList.length);
          for (var o in tempList) {
            markerList.add(
              Marker(
                point: LatLng(o.lat.toDouble(), o.lng.toDouble()),
                rotate: true,
                child: (o.battery > 20)
                    ? InkWell(
                        onTap: () {
                          print('amin 1');
                        },
                        child: SvgPicture.asset(
                          movementMarkerIcon,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          print('amin 2');
                        },
                        child: SvgPicture.asset(
                          chargeMarkerIcon,
                        ),
                      ),
              ),
            );
          }

          print(markerList.length);
          if (markerList.isNotEmpty) {
            mapController.move(
              markerList.first.point,
              17.0,
            );
          }
          update(['mapUpdate']);
        } else {
          showErrorSnakeBar(
            body: errorList
                .singleWhere(
                    (element) => element.code == apiResult['errorCode'])
                .message,
          );
        }
      },
    );

    print(tempList);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  void switchCollect({required bool collect}) {
    isCollect(collect);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Models/Search/near_place_model.dart';
import 'package:untitled1/Models/Search/station_model.dart';

class MapSearchController extends GetxController {
  TextEditingController searchTextController = TextEditingController();

  List<NearPlaceModel> nearPlaceList = [
    NearPlaceModel(
      id: 0,
      title: 'ولی‌عصر، زعفرانیه',
      description: 'تهران، ولی‌عصر، روبه‌روی باغ فردوس',
      isStared: false,
      scooterCount: 5,
    ),
    NearPlaceModel(
      id: 1,
      title: 'ولی‌عصر، سه‌راه آصف',
      description: 'تهران، ولی‌عصر، روبه‌روی باغ فردوس',
      isStared: false,
      scooterCount: 2,
    ),
    NearPlaceModel(
      id: 2,
      title: 'ایستگاه جردن، چهارراه اسفندیار',
      description: 'تهران، ولی‌عصر، روبه‌روی باغ فردوس',
      isStared: false,
      scooterCount: 1,
    ),
    NearPlaceModel(
      id: 3,
      title: 'ولی‌عصر، زعفرانیه',
      description: 'تهران، ولی‌عصر، روبه‌روی باغ فردوس',
      isStared: true,
      scooterCount: 4,
    ),
    NearPlaceModel(
      id: 4,
      title: 'ولی‌عصر، زعفرانیه',
      description: 'تهران، ولی‌عصر، روبه‌روی باغ فردوس',
      isStared: false,
      scooterCount: 12,
    ),
  ];

  List<StationModel> staredStationList = [
    StationModel(
      id: 0,
      title: 'ایستگاه پارک وی',
    ),
    StationModel(
      id: 1,
      title: 'ایستگاه ونک',
    ),
    StationModel(
      id: 2,
      title: 'ایستگاه جردن',
    ),
    StationModel(
      id: 3,
      title: 'ایستگاه پارک وی',
    ),
    StationModel(
      id: 4,
      title: 'ایستگاه ونک',
    ),
    StationModel(
      id: 5,
      title: 'ایستگاه جردن',
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/MapSearch/map_search_controller.dart';
import 'package:untitled1/Models/Search/station_model.dart';
import 'package:untitled1/Utils/widget_utils.dart';

class BuildStaredStationWidget extends StatelessWidget {
  BuildStaredStationWidget({super.key, required this.controller});

  final MapSearchController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .06,
      padding: paddingSymmetricV4,
      child: ListView.builder(
        itemCount: controller.staredStationList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buildStationItem(
            station: controller.staredStationList[index],
            index: index,
          );
        },
      ),
    );
  }

  Widget _buildStationItem({
    required StationModel station,
    required int index,
  }) {
    return animationConfig(
      widget: Container(
        margin: paddingSymmetricH10,
        height: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width * .07,
              height: Get.width * .07,
              decoration: BoxDecoration(
                color: Color(0XFFF6F6F6),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.star,
                  color: mainColor,
                ),
              ),
            ),
            SizedBox(
              width: Get.width * .01,
            ),
            Text(
              station.title,
              style: TextStyle(
                color: titleTextColor,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
      index: index,
    );
  }
}

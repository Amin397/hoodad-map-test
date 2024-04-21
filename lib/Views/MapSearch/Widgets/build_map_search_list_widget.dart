import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/MapSearch/map_search_controller.dart';
import 'package:untitled1/Models/Search/near_place_model.dart';
import 'package:untitled1/Utils/view_utils.dart';
import 'package:untitled1/Utils/widget_utils.dart';

class BuildMapSearchListWidget extends StatelessWidget {
  BuildMapSearchListWidget({super.key, required this.controller});

  final MapSearchController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: ListView.separated(
          itemCount: controller.nearPlaceList.length,
          physics: BouncingScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) {
            return animationConfig(widget: Divider(), index: index + 1);
          },
          itemBuilder: (BuildContext context, int index) {
            return _buildPlaceItem(
              place: controller.nearPlaceList[index],
              index: index,
            );
          },
        ),
      ),
    );
  }

  Widget _buildPlaceItem({
    required NearPlaceModel place,
    required int index,
  }) {
    return animationConfig(
      widget: Container(
        width: Get.width,
        height: Get.height * .08,
        child: Row(
          children: [
            (place.isStared)
                ? Icon(
                    Icons.star,
                    color: mainColor,
                  )
                : Icon(
                    Icons.star_border,
                    color: Colors.grey,
                  ),
            SizedBox(
              width: Get.width * .02,
            ),
            _buildPLaceBody(
              place: place,
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(
                    vertical: Get.height * .015,
                    horizontal: Get.width * .005,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: radiusAll70,
                    color: searchBorderColor.withOpacity(.05),
                  ),
                  padding: paddingSymmetricH4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: Get.width * .03),
                        child: Text(
                          '${replaceFarsiNumber(place.scooterCount.toString())}  اسکوتر',
                          style: TextStyle(
                            color: searchBorderColor,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        height: Get.width * .09,
                        width: Get.width * .09,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/scooter_img.png',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      index: index + 1,
    );
  }

  Widget _buildPLaceBody({required NearPlaceModel place}) {
    return Flexible(
      flex: 2,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: AutoSizeText(
                    place.title,
                    maxLines: 1,
                    maxFontSize: 22.0,
                    minFontSize: 18.0,
                    style: TextStyle(
                        color: titleTextColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Align(
                  alignment: Alignment.topRight,
                  child: AutoSizeText(
                    place.description,
                    maxLines: 1,
                    maxFontSize: 20.0,
                    minFontSize: 16.0,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: titleTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

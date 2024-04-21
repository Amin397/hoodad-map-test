import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/MapSearch/map_search_controller.dart';
import 'package:untitled1/Utils/view_utils.dart';
import 'package:untitled1/Utils/widget_utils.dart';
import 'package:untitled1/Views/MapSearch/Widgets/build_map_search_list_widget.dart';
import 'package:untitled1/Views/MapSearch/Widgets/build_stared_station_widget.dart';

class MapSearchScreen extends StatelessWidget {
  MapSearchScreen({super.key});

  final MapSearchController controller = Get.put(MapSearchController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              buildAppBar(
                isInnerPage: false,
                function: () {
                  Get.back();
                  Get.delete<MapSearchController>();
                },
                title: 'جستجو محدوده مکانی',
              ),
              animationConfig(
                widget: _buildSearchTextField(),
                index: 2,
              ),
              SizedBox(
                height: Get.height * .01,
              ),
              animationConfig(
                widget: BuildStaredStationWidget(
                  controller: controller,
                ),
                index: 2,
              ),
              animationConfig(
                widget: Padding(
                  padding: paddingSymmetricH8,
                  child: Divider(
                    color: Colors.grey[200],
                  ),
                ),
                index: 2,
              ),
              Expanded(
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  margin: paddingAll16,
                  child: Column(
                    children: [
                      animationConfig(
                        widget: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'مکان‌های پیشنهادی نزدیک شما',
                            style: TextStyle(
                              color: titleTextColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        index: 3,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      BuildMapSearchListWidget(
                        controller: controller,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: Get.width * .9,
        height: Get.height * .06,
        child: Center(
          child: TextField(
            controller: controller.searchTextController,
            style: TextStyle(),
            maxLines: 1,
            textInputAction: TextInputAction.search,
            textAlign: TextAlign.right,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: searchBorderColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFFF6F6F6),
              // b
              labelStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.grey.withOpacity(.7),
              ),
              labelText: 'جستجوی محدوده',
              enabledBorder: OutlineInputBorder(
                borderRadius: radiusAll20,
                borderSide: BorderSide(
                  width: 2.0,
                  color: Colors.grey.withOpacity(.4),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: radiusAll20,
                borderSide: BorderSide(
                  width: 2.0,
                  color: searchBorderColor,
                ),
              ),
              enabled: true,
              suffixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              // prefixIcon: prefix,
            ),
          ),
        ),
      ),
    );
  }
}

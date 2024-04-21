import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Menu/map_menu_controller.dart';
import 'package:untitled1/Utils/widget_utils.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final MapMenuController controller = Get.put(MapMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            buildAppBar(
              function: () {
                Get.back();
                Get.delete<MapMenuController>();
              },
              title: 'منو',
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: Get.width,
                padding: paddingAll16,
                child: Column(
                  children: [
                    animationConfig(
                      widget: _buildMenuItem(
                        id: 0,
                        title: 'حساب کاربری',
                        iconPath: profileIcon,
                      ),
                      index: 1,
                    ),
                    animationConfig(
                      widget: _buildMenuItem(
                        id: 1,
                        title: 'اسکوترهای اسکن‌شده',
                        iconPath: scanIcon,
                      ),
                      index: 1,
                    ),
                    animationConfig(
                      widget: _buildMenuItem(
                        id: 2,
                        title: 'تاریخچه',
                        iconPath: calendarIcon,
                      ),
                      index: 2,
                    ),
                    animationConfig(
                      widget: _buildMenuItem(
                        id: 3,
                        title: 'درآمدها',
                        iconPath: moneyIcon,
                      ),
                      index: 2,
                    ),
                    animationConfig(
                      widget: _buildMenuItem(
                        id: 4,
                        title: 'پیام‌ها',
                        iconPath: mailIcon,
                      ),
                      index: 3,
                    ),
                    animationConfig(
                      widget: _buildMenuItem(
                        id: 5,
                        title: 'درباره تالبان',
                        iconPath: taalIcon,
                      ),
                      index: 3,
                    ),
                    animationConfig(
                      widget: _buildMenuItem(
                        id: 6,
                        title: 'پشتیبانی',
                        iconPath: supportIcon,
                      ),
                      index: 4,
                    ),
                    animationConfig(
                      widget: _buildMenuItem(
                        id: 7,
                        title: 'قوانین و مقررات',
                        iconPath: logicIcon,
                      ),
                      index: 4,
                    ),
                    animationConfig(
                      widget: _buildMenuItem(
                        id: 9,
                        title: 'راهنما',
                        iconPath: infoIcon,
                      ),
                      index: 5,
                    ),
                    animationConfig(
                      widget: _buildMenuItem(
                        id: 10,
                        title: 'تنظیمات',
                        iconPath: infoIcon,
                      ),
                      index: 5,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/logoTall.svg',
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: Get.height * .01,
                  ),
                  Text(
                    'Version 1.0',
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height * .05,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String iconPath,
    required String title,
    required int id,
  }) {
    return InkWell(
      onTap: () {
        controller.goToPage(
          id: id,
        );
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: radiusAll16,
      ),
      child: Container(
        width: Get.width,
        height: Get.height * .05,
        margin: paddingSymmetricV8,
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey,
              size: 20.0,
            ),
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: titleTextColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * .05,
            ),
            Container(
              height: Get.width * .1,
              width: Get.width * .1,
              decoration: BoxDecoration(
                borderRadius: radiusAll12,
                color: mainColor.withOpacity(.15),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  height: Get.width * .06,
                  width: Get.width * .06,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

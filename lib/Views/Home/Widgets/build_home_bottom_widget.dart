import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Home/home_controller.dart';

class BuildHomeBottomWidget extends StatelessWidget {
  BuildHomeBottomWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Get.height * .25,
        width: Get.width,
        padding: paddingAll16,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(.7),
              Colors.white.withOpacity(.5),
              Colors.white.withOpacity(.3),
              Colors.white.withOpacity(.1),
              Colors.white.withOpacity(0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            _buildButtonsRow(
              iconOne: mainFilterIcon,
              functionOne: () {
                controller.switchFilterOn();
              },
              iconTwo: 'assets/images/Icons/refreshIcon.svg',
              functionTwo: () {

              },
            ),
            _buildButtonsRow(
              iconOne: 'assets/images/Icons/searchIcon.svg',
              functionOne: () {
                controller.goToSearch();
              },
              iconTwo: 'assets/images/Icons/currentLocationIcon.svg',
              functionTwo: () {},
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Get.height * .06,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: radiusAll16,
                    boxShadow: shadow(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'جمع‌کردن',
                        style: TextStyle(
                          color: titleTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      SvgPicture.asset(
                        'assets/images/Icons/unlockIcon.svg',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsRow({
    required String iconOne,
    required String iconTwo,
    required GestureTapCallback functionOne,
    required GestureTapCallback functionTwo,
  }) {
    return Container(
      height: Get.height * .07,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: functionOne,
            child: Container(
              height: Get.width * .12,
              width: Get.width * .12,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadow(),
                borderRadius: radiusAll16,
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconOne,
                  height: Get.width * .06,
                  width: Get.width * .06,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: functionTwo,
            child: Container(
              height: Get.width * .12,
              width: Get.width * .12,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadow(),
                borderRadius: radiusAll16,
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconTwo,
                  height: Get.width * .06,
                  width: Get.width * .06,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

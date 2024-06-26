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
            _buildButtonsRow1(
              functionOne: () {
                controller.switchFilterOn();
              },
              iconTwo: refreshIcon,
              functionTwo: () {},
            ),
            _buildButtonsRow(
              iconOne: searchIcon,
              functionOne: () {
                controller.goToSearch();
              },
              iconTwo: currentLocationIcon,
              functionTwo: () {
                controller.updateLocation();
              },
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

  Widget _buildButtonsRow1({
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
              child: GetBuilder(
                init: controller,
                id: 'filterSwitch',
                builder: (ctx) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 50), // Animation duration
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: (ctx.isFilterOn.isTrue)
                        ? AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            progress: ctx.animationController!,
                          )
                        : Center(
                            child: SvgPicture.asset(
                              mainFilterIcon,
                              height: Get.width * .06,
                              width: Get.width * .06,
                            ),
                          ),
                  );
                },
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

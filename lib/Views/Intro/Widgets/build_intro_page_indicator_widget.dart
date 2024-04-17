import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Intro/intro_controller.dart';

class BuildIntroPageIndicatorWidget extends StatelessWidget {
  BuildIntroPageIndicatorWidget({super.key, required this.controller});

  final IntroController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: controller.introList
          .map(
            (e) => Obx(
              () => AnimatedContainer(
                margin: paddingSymmetricH4,
                duration: const Duration(milliseconds: 350),
                width: (controller.currentIndex.value == e.id)
                    ? Get.width * .1
                    : Get.height * .01,
                height: Get.height * .01,
                decoration: BoxDecoration(
                  color: (controller.currentIndex.value == e.id)
                      ? Colors.black
                      : Colors.black26,
                  borderRadius: radiusAll42,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

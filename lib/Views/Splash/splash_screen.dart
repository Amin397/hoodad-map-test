import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Positioned(
              top: Get.height * .1,
              child: Container(
                width: Get.width,
                height: Get.height * .1,
                child: Obx(
                  () => Row(
                    children: [
                      AnimatedContainer(
                        height: double.maxFinite,
                        width: controller.containerTwoW.value,
                        duration: const Duration(milliseconds: 500),
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .8,
                          minWidth: Get.width * .2,
                        ),
                        decoration: BoxDecoration(
                          color: mainColor.withOpacity(.2),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      Expanded(
                        child: AnimatedContainer(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: mainColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topLeft: Radius.circular(100),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: Get.height * .3,
              child: Container(
                width: Get.width,
                height: Get.height * .1,
                child: Obx(
                  () => Row(
                    children: [
                      AnimatedContainer(
                        height: double.maxFinite,
                        width: controller.containerOneW.value,
                        duration: const Duration(milliseconds: 500),
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .8,
                          minWidth: Get.width * .2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: mainColor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      Expanded(
                        child: AnimatedContainer(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: mainColor.withOpacity(.2),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topLeft: Radius.circular(100),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: Get.height * .5,
              child: Container(
                width: Get.width,
                height: Get.height * .1,
                child: Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: mainColor.withOpacity(.2),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100),
                              topRight: Radius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      AnimatedContainer(
                        height: double.maxFinite,
                        width: controller.containerOneW.value,
                        duration: const Duration(milliseconds: 500),
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .8,
                          minWidth: Get.width * .2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: mainColor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Get.height * .23,
              child: Container(
                width: Get.width,
                height: Get.height * .1,
                child: Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(

                            border: Border.all(
                              color: mainColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100),
                              topRight: Radius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      AnimatedContainer(
                        height: double.maxFinite,
                        width: controller.containerTwoW.value,
                        duration: const Duration(milliseconds: 500),
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .8,
                          minWidth: Get.width * .2,
                        ),
                        decoration: BoxDecoration(
                          color: mainColor.withOpacity(.2),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Get.height * .05,
              child: Container(
                width: Get.width,
                height: Get.height * .1,
                child: Obx(
                      () => Row(
                    children: [
                      AnimatedContainer(
                        height: double.maxFinite,
                        width: controller.containerOneW.value,
                        duration: const Duration(milliseconds: 500),
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .8,
                          minWidth: Get.width * .2,
                        ),
                        decoration: BoxDecoration(
                          color: mainColor.withOpacity(.1),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      Expanded(
                        child: AnimatedContainer(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: mainColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topLeft: Radius.circular(100),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),


            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: Get.height * .15,
                width: Get.height * .15,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: Get.height * .05,
                ),
                height: Get.height * .15,
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
            )
          ],
        ),
      ),
    );
  }
}

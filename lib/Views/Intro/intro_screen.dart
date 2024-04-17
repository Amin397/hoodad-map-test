import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Intro/intro_controller.dart';
import 'package:untitled1/Utils/widget_utils.dart';
import 'package:untitled1/Views/Intro/Widgets/build_intro_page_indicator_widget.dart';
import 'package:untitled1/Views/Intro/Widgets/build_intro_page_view_widget.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              deepMainColor,
              mainColor,
              mainColor.withOpacity(.8),
              mainColor.withOpacity(.7),
              mainColor.withOpacity(.5),
              mainColor.withOpacity(.35),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Stack(
          children: [
            _buildBgPart(),
            Container(
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * .095,
                  ),
                  animationConfig(
                    widget: SvgPicture.asset(
                      'assets/images/logoTall.svg',
                      color: Colors.black,
                    ),
                    index: 2,
                  ),
                  SizedBox(
                    height: Get.height * .05,
                  ),
                  animationConfig(
                    widget: BuildIntroPageViewWidget(
                      controller: controller,
                    ),
                    index: 3,
                  ),
                  SizedBox(
                    height: Get.height * .03,
                  ),
                  animationConfig(
                    widget: Container(
                      width: Get.width * .5,
                      height: Get.height * .03,
                      child: BuildIntroPageIndicatorWidget(
                        controller: controller,
                      ),
                    ),
                    index: 4,
                  ),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: double.maxFinite,
                      width: Get.width,
                      child: animationConfig(
                        widget: _buildAcceptButton(),
                        index: 5,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBgPart() {
    return animationConfig(
      widget: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Positioned(
              left: -10.0,
              top: Get.height * .06,
              child: Container(
                width: Get.width * .8,
                height: Get.height * .1,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: .8,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -10.0,
              top: Get.height * .3,
              child: Container(
                width: Get.width * .95,
                height: Get.height * .1,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: .2,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    topLeft: Radius.circular(100),
                  ),
                ),
              ),
            ),
            Positioned(
              left: -10.0,
              top: Get.height * .5,
              child: Container(
                width: Get.width * .2,
                height: Get.height * .1,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: .5,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -10.0,
              bottom: Get.height * .25,
              child: Container(
                width: Get.width * .5,
                height: Get.height * .1,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: .5,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    topLeft: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      index: 1,
    );
  }

  Widget _buildAcceptButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: (){
          controller.goToLogin();
        },
        child: Container(
          height: Get.height * .07,
          width: Get.width,
          margin: paddingAll18,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radiusAll12,
            boxShadow: shadow(),
          ),
          child: Center(
            child: AutoSizeText(
              'ورود',
              maxLines: 1,
              maxFontSize: 24.0,
              minFontSize: 20.0,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

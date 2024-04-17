import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Intro/intro_controller.dart';
import 'package:untitled1/Models/Intro/intro_model.dart';

class BuildIntroPageViewWidget extends StatelessWidget {
  BuildIntroPageViewWidget({super.key, required this.controller});

  final IntroController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width,
        height: Get.height * .65,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            onPageChanged: (page) {
              controller.changePage(
                page: page,
              );
            },
            controller: controller.pageController,
            itemCount: controller.introList.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildIntroItem(
                item: controller.introList[index],
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildIntroItem({
    required IntroModel item,
    required int index,
  }) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Align(
              alignment: item.alignment,
              child: Image.asset(
                item.image,
              ),
            ),
          ),
        ),
        SizedBox(
          height: Get.height * .02,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: paddingSymmetricH16,
            child: AutoSizeText(
              item.title,
              maxLines: 1,
              maxFontSize: 24.0,
              minFontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}

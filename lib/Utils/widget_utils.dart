import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';

Widget animationConfig({
  required Widget widget,
  required int index,
}) {
  return AnimationConfiguration.synchronized(
    child: SlideAnimation(
      duration: Duration(milliseconds: index * 400),
      child: FadeInAnimation(
        duration: Duration(milliseconds: index * 400),
        child: widget,
      ),
    ),
  );
}

Widget buildAppBar({
  required VoidCallback function,
  required String title,
  required bool isInnerPage,
}) {
  return Container(
    width: Get.width,
    height: Get.height * .08,
    margin: EdgeInsets.only(
      top: Get.height * .025,
    ),
    padding: paddingSymmetricH20,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
          },
          icon: Icon(
            Icons.clear,
            color: Colors.white,
            size: 10.0,
          ),
        ),
        Text(
          // 'جستجو محدوده مکانی',
          title,
          style: TextStyle(
            color: titleTextColor,
            fontSize: 18.0,
          ),
        ),
        IconButton(
          onPressed: function,
          icon: Icon(
            (isInnerPage)?Icons.arrow_forward_ios:Icons.clear,
            color: titleTextColor,
          ),
        ),
      ],
    ),
  );
}

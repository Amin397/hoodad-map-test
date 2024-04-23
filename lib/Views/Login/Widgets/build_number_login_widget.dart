import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Login/login_controller.dart';
import 'package:untitled1/Utils/shake_animation_utils.dart';
import 'package:untitled1/Utils/view_utils.dart';
import 'package:untitled1/Utils/widget_utils.dart';

class BuildNumberLoginWidget extends StatelessWidget {
  BuildNumberLoginWidget({super.key, required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: double.maxFinite,
      margin: paddingAll24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          animationConfig(
            widget: Text(
              'ورود به اپلیکیشن تال‌بان',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
            index: 1,
          ),
          animationConfig(
            widget: Text(
              '. برای ورود شماره موبایل خود را وارد کنید',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black45,
              ),
            ),
            index: 1,
          ),
          SizedBox(
            height: Get.height * .07,
          ),
          animationConfig(
            widget: Text(
              'شماره موبایل',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            index: 2,
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          animationConfig(
            widget: CustomShakeWidget(
              shakeCount: 4,
              shakeOffset: 4.0,
              duration: const Duration(milliseconds: 750),
              key: controller.numberErrorKey,
              child: myTextField(
                width: Get.width,
                height: Get.height * .07,
                hint: 'شماره موبایل خود را وارد کنید',
                controller: controller.phoneNumberTextController!,
                textStyle: TextStyle(
                  fontSize: 22.0,
                ),
                textAlign: TextAlign.center,
                inputType: TextInputType.number,
                enable: true,
                maxLine: 1,
                maxLength: 11,
                suffix: Icon(
                  Icons.phone_android_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
            index: 2,
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          Obx(
            () => (controller.errorText.value.length > 3)
                ? animationConfig(
                    widget: Text(
                      controller.errorText.value,
                      style: TextStyle(
                        color: Colors.red.shade700,
                      ),
                    ),
                    index: 2,
                  )
                : SizedBox(),
          ),
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    controller.sendOtpCode();
                    //
                    //
                    // print('asasas');
                  },
                  child: animationConfig(
                    widget: Container(
                      height: Get.height * .06,
                      width: Get.width,
                      decoration: BoxDecoration(
                        boxShadow: shadow(),
                        color: deepMainColor,
                        borderRadius: radiusAll16,
                      ),
                      child: Center(
                        child: AutoSizeText(
                          'دریافت کد تایید',
                          maxFontSize: 24.0,
                          minFontSize: 20.0,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    index: 3,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

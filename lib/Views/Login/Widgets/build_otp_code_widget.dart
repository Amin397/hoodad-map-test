import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Login/login_controller.dart';
import 'package:untitled1/Utils/widget_utils.dart';
import 'package:untitled1/Views/Login/Widgets/build_pin_code_fields_widget.dart';

class BuildOtpCodeWidget extends StatelessWidget {
  BuildOtpCodeWidget({super.key, required this.controller});

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
              'کد تایید را وارد کنید',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: titleTextColor,
              ),
            ),
            index: 1,
          ),
          animationConfig(
            widget: RichText(
              text: TextSpan(
                text: '.کد تایید برای شماره موبایل  ',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black45,
                  fontFamily: 'Yekan',
                ),
                children: [
                  TextSpan(
                    text: controller.phoneNumberTextController!.text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: titleTextColor,
                    ),
                  ),
                  TextSpan(
                    text: '  پیامک شد',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                    ),
                  )
                ],
              ),
            ),
            index: 1,
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          animationConfig(
            widget: Text(
              'کد تایید ۶ رقمی',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: titleTextColor,
              ),
            ),
            index: 2,
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          animationConfig(
            widget: BuildPinCodeFieldsWidget(
              controller: controller,
            ),
            index: 3,
          ),
          Obx(
            () => Align(
              alignment: Alignment.centerRight,
              child: Text(
                (controller.hasError.isTrue)
                    ? '.کد تایید وارد شده نادرست است'
                    : '',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildTextButtons(),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  InkWell(
                    onTap: () {
                      controller.goToHome();
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
                            'تایید',
                            maxFontSize: 24.0,
                            minFontSize: 20.0,
                            maxLines: 1,
                            style: TextStyle(
                              color: titleTextColor,
                            ),
                          ),
                        ),
                      ),
                      index: 3,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextButtons() {
    return Container(
      width: Get.width,
      height: Get.height * .05,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Obx(
                  () => (controller.secondsRemaining == 0)
                      ? TextButton(
                          onPressed: () {
                            controller.startTimer();
                          },
                          child: Text(
                            'ارسال مجدد',
                            style: TextStyle(
                              color: resendTextColor,
                              fontSize: 18.0,
                            ),
                          ),
                        )
                      : Text(
                          '  ارسال مجدد  ${controller.timerText}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black45,
                          ),
                        ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    controller.changePhoneNumber();
                  },
                  child: Text(
                    'ویرایش شماره موبایل',
                    style: TextStyle(
                      color: titleTextColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

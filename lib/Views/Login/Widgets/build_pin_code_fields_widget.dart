import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Login/login_controller.dart';
import 'package:untitled1/Utils/shake_animation_utils.dart';

class BuildPinCodeFieldsWidget extends StatelessWidget {
  BuildPinCodeFieldsWidget({super.key, required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .08,
      child: CustomShakeWidget(
        child: PinCodeTextField(
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          autoDismissKeyboard: true,
          autoDisposeControllers: false,
          autoFocus: true,
          enablePinAutofill: true,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: radiusAll12,
            fieldHeight: Get.width * .13,
            fieldWidth: Get.width * .13,
            activeFillColor: Colors.white,
            activeColor: Colors.grey[200],
            errorBorderColor: Colors.red,
            selectedColor: Colors.grey[200],
            selectedFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            inactiveColor: Colors.grey[200],
          ),
          errorTextDirection: TextDirection.rtl,
          cursorColor: deepMainColor,
          textStyle: TextStyle(
            fontSize: 26.0,
            height: 2.4,
            fontFamily: 'Yekan',
          ),
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          // errorAnimationController: controller.errorController,
          controller: controller.pinCodeTextController,
          onCompleted: (v) {
            controller.verifyOtpCode(
              code: v,
            );
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            return true;
          },
          appContext: context,
        ),
        shakeCount: 4,
        shakeOffset: 4.0,
        duration: const Duration(milliseconds: 750),
        key: controller.pinErrorKey,
      ),
    );
  }
}

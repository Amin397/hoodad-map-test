import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled1/Consts/error_code.dart';
import 'package:untitled1/Utils/API/project_requests_utils.dart';
import 'package:untitled1/Utils/routs_utils.dart';
import 'package:untitled1/Utils/shake_animation_utils.dart';
import 'package:untitled1/Utils/view_utils.dart';

class LoginController extends GetxController {
  bool isNumberEntered = false;
  RxBool hasError = false.obs;
  String? phoneNumber;
  String? otpId;
  RxString errorText = ''.obs;
  int? userId;

  Timer? timeToResend;

  RxInt secondsRemaining = 60.obs;

  TextEditingController? phoneNumberTextController;
  TextEditingController? pinCodeTextController;

  ProjectRequestsUtils requests = ProjectRequestsUtils();

  late GlobalKey<CustomShakeWidgetState> numberErrorKey;
  late GlobalKey<CustomShakeWidgetState> pinErrorKey;

  @override
  void onInit() {
    numberErrorKey = GlobalKey();
    pinErrorKey = GlobalKey();
    phoneNumberTextController = TextEditingController();
    pinCodeTextController = TextEditingController();

    super.onInit();
  }

  void startTimer() {
    secondsRemaining(60);
    timeToResend =
        new Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (secondsRemaining < 1) {
        timer.cancel();
      } else {
        secondsRemaining--;
      }
      update(['resendTimer']);
    });
  }

  String get timerText {
    int minutes = secondsRemaining ~/ 60;
    num seconds = secondsRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void sendOtpCode() async {
    FocusManager.instance.primaryFocus?.unfocus();
    showLoadingAlert();
    requests
        .sendOtpCode(
      phoneNumber: phoneNumberTextController!.text,
    )
        .then((value) {
      Get.back();
      Map<String, dynamic> apiResult = jsonDecode(value!.body);

      if (apiResult['errorCode'] == null) {
        errorText.value = '';
        otpId = apiResult['result']['otpId'];
        userId = apiResult['result']['userId'];
        isNumberEntered = true;
        startTimer();
        showSuccessSnakeBar(
          body: 'کد تایید برای شما ارسال شد',
        );
        update(['loginSwitcher']);
      } else {
        Future.delayed(const Duration(milliseconds: 400), () {
          numberErrorKey.currentState!.shake();
        });

        errorText.value = errorList
            .singleWhere((element) => element.code == apiResult['errorCode'])
            .message;
        showErrorSnakeBar(
          body: errorText.value,
        );
      }
    });
  }

  @override
  void dispose() {
    phoneNumberTextController!.dispose();
    pinCodeTextController!.dispose();
    numberErrorKey.currentState!.dispose();
    pinErrorKey.currentState!.dispose();
    super.dispose();
  }

  void changePhoneNumber() {
    FocusManager.instance.primaryFocus?.unfocus();
    timeToResend!.cancel();
    secondsRemaining(60);
    // pinCodeTextController!.dispose();
    // phoneNumberTextController = TextEditingController();
    // errorController!.close();
    Future.delayed(const Duration(milliseconds: 500), () {
      isNumberEntered = false;
      update(['loginSwitcher']);
    });
  }

  void goToHome() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.offAllNamed(
      NameRouts.home,
    );
  }
}

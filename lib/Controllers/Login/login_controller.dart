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
import 'package:untitled1/Utils/storage_utils.dart';
import 'package:untitled1/Utils/view_utils.dart';

class LoginController extends GetxController {
  bool isNumberEntered = false;
  RxBool hasError = false.obs;
  String? phoneNumber;
  String? otpId;
  RxString errorText = ''.obs;
  String pinErrorText = '';
  int? userId;

  Timer? timeToResend;

  RxInt secondsRemaining = 120.obs;

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
    secondsRemaining(120);
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

  void sendOtpCode({required bool isResend}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    errorText('');
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
        pinCodeTextController!.clear();
        if (!isResend) {
          isNumberEntered = true;
        }
        startTimer();
        showSuccessSnakeBar(
          body: 'کد تایید برای شما ارسال شد',
        );
        update(['loginSwitcher']);
      } else {
        errorText.value = errorList
            .singleWhere((element) => element.code == apiResult['errorCode'])
            .message;

        Future.delayed(const Duration(milliseconds: 400), () {
          if (!isResend) {
            numberErrorKey.currentState!.shake();
          }
        });
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
    secondsRemaining(120);
    errorText.value = '';
    hasError(false);
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

  void verifyOtpCode({required String code}) async {
    showLoadingAlert();
    requests.verifyOtpCode(otpCode: code, otpId: otpId!, userId: userId!).then(
      (value) async {
        Map<String, dynamic> apiResult = jsonDecode(value!.body);
        if (apiResult['errorCode'] == null) {
          timeToResend!.cancel();
          secondsRemaining(0);

          await generateToken();

          // Get.offAllNamed(
          //   NameRouts.home,
          // );
        } else {
          Get.back();
          hasError(true);
          Future.delayed(const Duration(milliseconds: 400), () {
            pinErrorKey.currentState!.shake();
          });
          pinErrorText = errorList
              .singleWhere((element) => element.code == apiResult['errorCode'])
              .message;
          showErrorSnakeBar(
            body: pinErrorText,
          );
        }
      },
    );
  }

  Future<void> generateToken() async {
    requests
        .generateToken(
      otpId: otpId!,
      userId: userId!,
      otpCode: pinCodeTextController!.text,
    )
        .then((value) {
      hasError(false);
      Get.back();

      Map<String, dynamic> apiResult = jsonDecode(value!.body);
      if (apiResult['errorCode'] == null) {
        StorageUtils.setToken(token: apiResult['result']['token']);
        showSuccessSnakeBar(
          body: 'با موفقیت وارد شدی',
        );
        Future.delayed(const Duration(seconds: 4), () {
          Get.offAllNamed(NameRouts.home);
          Get.delete<LoginController>();
        });
      }
    });
  }
}

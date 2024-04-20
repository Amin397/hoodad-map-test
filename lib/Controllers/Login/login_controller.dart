import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled1/Utils/routs_utils.dart';

class LoginController extends GetxController {
  bool isNumberEntered = false;
  RxBool hasError = false.obs;
  String? phoneNumber;

  Timer? timeToResend;

  RxInt secondsRemaining = 90.obs;

  TextEditingController? phoneNumberTextController;
  TextEditingController? pinCodeTextController;

  // StreamController<ErrorAnimationType>? errorController;

  @override
  void onInit() {
    phoneNumberTextController = TextEditingController();
    pinCodeTextController = TextEditingController();
    // errorController = StreamController<ErrorAnimationType>();

    super.onInit();
  }

  void startTimer() {
    secondsRemaining(90);
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

  sendOtpCode() {
    FocusManager.instance.primaryFocus?.unfocus();
    // phoneNumberTextController!.dispose();
    // pinCodeTextController = TextEditingController();

    startTimer();
    Future.delayed(const Duration(milliseconds: 500), () {
      isNumberEntered = true;
      update(['loginSwitcher']);
    });
  }

  @override
  void dispose() {
    phoneNumberTextController!.dispose();
    pinCodeTextController!.dispose();
    // errorController!.close();
    super.dispose();
  }

  void changePhoneNumber() {
    FocusManager.instance.primaryFocus?.unfocus();
    timeToResend!.cancel();
    secondsRemaining(90);
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

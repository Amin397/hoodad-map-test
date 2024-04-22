import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';

Widget myTextField({
  required double width,
  required double height,
  required String hint,
  Widget suffix = const SizedBox(),
  Widget prefix = const SizedBox(),
  bool enable = true,
  int? maxLine,
  int? maxLength,
  // TextInputAction? inputAction = TextInputAction.newline,
  ValueChanged<String>? onChange,
  required TextEditingController controller,
  required TextStyle textStyle,
  EdgeInsets margin = EdgeInsets.zero,
  EdgeInsets padding = EdgeInsets.zero,
  TextAlign textAlign = TextAlign.left,
  GestureTapCallback? onTap,
  TextInputAction inputAction = TextInputAction.done,
  TextInputType inputType = TextInputType.text,
  bool autoFocus = false,
  bool obscureText = false,
  List<TextInputFormatter>? textMask,
}) {
  return Container(
    width: width,
    height: height,
    margin: margin,
    padding: padding,
    child: TextField(
      inputFormatters: textMask ?? [],
      obscureText: obscureText,
      controller: controller,
      style: textStyle,
      maxLines: maxLine ?? 1,
      enabled: enable,
      onTap: onTap,
      maxLength: maxLength,
      onChanged: onChange,
      textInputAction: inputAction,
      textAlign: textAlign,
      keyboardType: inputType,
      autofocus: autoFocus,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        counter: const SizedBox(),
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.grey.withOpacity(.4),
        ),
        // hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.grey.withOpacity(.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusAll12,
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.grey.withOpacity(.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusAll12,
          borderSide: BorderSide(
            width: 2.0,
            color: mainColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: radiusAll12,
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.blue,
          ),
        ),
        enabled: enable,
        suffixIcon: suffix,
        prefixIcon: prefix,
      ),
    ),
  );
}

Widget LoadingAlertWidget({
  required bool isCanCancel,
}) {
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Container(
      width: Get.width,
      height: Get.height * .4,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/anims/loading.json',
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          Text(
            'Loading...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: Get.height * .03,
          ),
          (isCanCancel)
              ? InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: Get.width * .4,
                    height: Get.height * .05,
                    decoration: BoxDecoration(
                      color: Colors.red.shade700,
                      borderRadius: radiusAll12,
                    ),
                    child: Center(
                      child: AutoSizeText(
                        'Cancel',
                        maxLines: 1,
                        maxFontSize: 20.0,
                        minFontSize: 14.0,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    ),
  );
}

void showSuccessSnakeBar({
  required String body,
}) async {
  Get.snackbar(
    'Yesss :)',
    body,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    backgroundColor: Colors.green.withOpacity(.5),
    snackPosition: SnackPosition.TOP,
    margin: paddingAll6,
    colorText: Colors.black,
    animationDuration: const Duration(milliseconds: 800),
    duration: const Duration(seconds: 4),
    icon: Lottie.asset(
      'assets/anims/success.json',
    ),
    leftBarIndicatorColor: Colors.green.shade800,
    barBlur: 3.0,
    borderRadius: 10.0,
    isDismissible: true,
    // borderWidth: 1.5,
    // borderColor: Colors.green,
  );
}

void showLoadingAlert() {
  RxBool isCanCancel = false.obs;

  Timer cancelTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    if (timer.tick >= 20) {
      isCanCancel(true);
    }
  });

  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: Obx(
          () => LoadingAlertWidget(
            isCanCancel: isCanCancel.value,
          ),
        ),
      );
    },
  ).then((value) {
    cancelTimer.cancel();
  });
}

String replaceFarsiNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }

  return input;
}

String moneyFormat(
  double? price, {
  bool toman = false,
}) {
  price ??= 0.0;
  return price.toInt().toString().seRagham() + (toman ? '   تومان ' : '');
}

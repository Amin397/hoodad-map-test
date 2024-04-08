import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
      inputFormatters: textMask??[],
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
        label: Text(hint),
        labelStyle: const TextStyle(
          fontSize: 16.0,
          color: Colors.grey,
        ),
        // hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 16.0,
          color: Colors.grey,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.blue,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.blue,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.blue,
          ),
        ),
        enabled: enable,
        suffixIcon: suffix,
        prefix: prefix,
      ),
    ),
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
          CircularProgressIndicator(),
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
                child: Text(
                  'Cancel',
                  maxLines: 1,
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

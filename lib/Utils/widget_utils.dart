import 'package:flutter/cupertino.dart';
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



Widget filledTextField({
  required TextEditingController controller,
  required String label,
  Widget suffix = const SizedBox(),
  Widget prefix = const SizedBox(),
  int? maxLine,
  int? maxLength,
  ValueChanged<String>? onChange,
  required TextStyle textStyle,
  TextAlign textAlign = TextAlign.left,
  GestureTapCallback? onTap,
  TextInputAction inputAction = TextInputAction.done,
  TextInputType inputType = TextInputType.text,
  bool autoFocus = false,
  bool obscureText = false,
}){
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
      width: Get.width * .9,
      height: Get.height * .06,
      child: Center(
        child: TextField(
          controller: controller,
          style: textStyle,
          maxLines: 1,
          textInputAction: inputAction,
          textAlign: textAlign,
          keyboardType: inputType,
          obscureText: obscureText,
          autofocus: autoFocus,
          maxLength: maxLength,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: searchBorderColor,
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: fillTextColor,
            // b
            labelStyle: TextStyle(
              fontSize: 16.0,
              color: Colors.grey.withOpacity(.7),
            ),
            labelText: label,
            enabledBorder: OutlineInputBorder(
              borderRadius: radiusAll20,
              borderSide: BorderSide(
                width: .5,
                color: Colors.grey.withOpacity(.1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: radiusAll20,
              borderSide: BorderSide(
                width: 2.0,
                color: searchBorderColor,
              ),
            ),
            enabled: true,
            suffixIcon: suffix,
            prefix: prefix,
            // prefixIcon: prefix,
          ),
        ),
      ),
    ),
  );
}
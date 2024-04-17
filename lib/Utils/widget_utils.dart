

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untitled1/Consts/colors.dart';

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
        counter: SizedBox(),
        border: OutlineInputBorder(),
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
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: mainColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: mainColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: mainColor,
          ),
        ),
        enabled: enable,
        suffixIcon: suffix,
        prefix: prefix,
      ),
    ),
  );
}





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



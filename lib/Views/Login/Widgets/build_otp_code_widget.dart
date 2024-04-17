import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Login/login_controller.dart';


class BuildOtpCodeWidget extends StatelessWidget {
  BuildOtpCodeWidget({super.key , required this.controller});


  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: double.maxFinite,
      color: Colors.green,
      margin: paddingAll24,
    );
  }
}

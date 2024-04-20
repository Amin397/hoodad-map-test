import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controllers/Home/home_controller.dart';



class BuildFilterWidget extends StatelessWidget {
  BuildFilterWidget({super.key , required this.controller});


  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: Get.width,
        height: Get.height * .1,
        color: Colors.red,
      ),
    );
  }
}

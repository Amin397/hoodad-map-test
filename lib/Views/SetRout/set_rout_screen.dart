
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controllers/SetRout/set_rout_controller.dart';

class SetRoutScreen extends StatelessWidget {
  SetRoutScreen({super.key});


  final SetRoutController controller = Get.put(SetRoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SafeArea(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controllers/Splash/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

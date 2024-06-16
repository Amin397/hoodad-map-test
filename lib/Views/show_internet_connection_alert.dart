import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/Consts/measures.dart';

class ShowInternetConnectionAlert extends StatelessWidget {
  const ShowInternetConnectionAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .5,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radiusAll8,
      ),
      padding: paddingAll16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/anims/netConnection.json',
            height: Get.height * .3,
            width: Get.height * .3,
          ),
          Text(
            'لطفا دسترسی خود به اینترنت را بررسی کنید',
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          InkWell(
            onTap: (){
              Get.back();
            },
            child: Container(
              width: Get.width * .4,
              height: Get.height * .06,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: radiusAll8,
              ),
              child: Center(
                child: AutoSizeText(
                  'OK !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

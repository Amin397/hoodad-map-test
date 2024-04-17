import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled1/Utils/routs_utils.dart';

class SplashController extends GetxController {
  RxDouble containerOneW = (Get.width * .2).obs;
  RxDouble containerTwoW = (Get.width * .45).obs;
  bool revers = false;
  bool revers2 = false;

  Timer? timer1;
  Timer? timer2;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    timer1 = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if(!revers){
        containerOneW.value = containerOneW.value + (Get.width * .05);
        if(containerOneW.value == Get.width * .7){
          revers = true;
        }
      }else{
        containerOneW.value = containerOneW.value - (Get.width * .05);
        if(containerOneW.value <= Get.width * .2){
          revers = false;
        }
      }
    });

    timer2 = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if(!revers2){
        containerTwoW.value = containerTwoW.value + (Get.width * .05);
        if(containerTwoW.value >= Get.width * .85){
          revers2 = true;
        }
      }else{
        containerTwoW.value = containerTwoW.value - (Get.width * .05);
        if(containerTwoW.value <= Get.width * .1){
          revers2 = false;
        }
      }
    });


    Future.delayed(const Duration(seconds: 4) , (){
      Get.offAllNamed(NameRouts.intro);
    });

  }


  @override
  void onClose() {
    timer1!.cancel();
    timer2!.cancel();
    super.onClose();
  }
}


import 'package:get/get.dart';
import 'package:untitled1/Utils/routs_utils.dart';

class SplashController extends GetxController{



  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {


    Future.delayed(const Duration(seconds: 3) , (){
      Get.offAllNamed(NameRouts.setRout);
    });
  }
}
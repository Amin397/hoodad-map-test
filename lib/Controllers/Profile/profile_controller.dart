import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Utils/routs_utils.dart';
import 'package:untitled1/Utils/storage_utils.dart';
import 'package:untitled1/Utils/view_utils.dart';
import 'package:untitled1/Views/Profile/Widgets/build_exit_alert_modal.dart';

class ProfileController extends GetxController {
  RxBool animationStart = false.obs;

  void goToPage({required int id}) {
    switch (id) {
      case 0:
        {
          Get.toNamed(NameRouts.editProfile);
          break;
        }
      case 1:
        {
          Get.toNamed(NameRouts.messages);
          break;
        }
      default:
        {
          showExitAlert();
          break;
        }
    }
  }

  void showExitAlert() async {
    var result = await showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      isScrollControlled: false,
      elevation: 0.0,
      enableDrag: false,
      builder: (BuildContext context) => BuildExitAlertModal(),
    );

    if(result is int && result == 1){

      showLoadingAlert();

      Future.delayed(const Duration(seconds: 3) ,()async{
        await StorageUtils.deleteToken();
        Get.offAllNamed(NameRouts.splash);
      });
    }
  }

  void startAnimation() {
    if (animationStart.isFalse) {
      animationStart(true);
      Future.delayed(const Duration(seconds: 5), () {
        animationStart(false);
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Views/Profile/Widgets/build_exit_alert_modal.dart';

class ProfileController extends GetxController {
  void goToPage({required int id}) {
    switch (id) {
      case 0:
        {
          break;
        }
      case 1:
        {
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
      // isDismissible: false,
      isScrollControlled: false,
      elevation: 0.0,
      enableDrag: false,
      builder: (BuildContext context) => BuildExitAlertModal(),
    );


  }
}

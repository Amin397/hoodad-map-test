import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';

class BuildExitAlertModal extends StatelessWidget {
  const BuildExitAlertModal({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: 0);
        return false;
      },
      child: Container(
        width: Get.width,
        height: Get.height * .4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
        ),
        padding: paddingAll16,
        child: Column(
          children: [
            Text(
              'خروج از حساب کاربری',
              style: TextStyle(
                color: titleTextColor,
                fontSize: 22.0,
              ),
            ),
            Lottie.asset(
              'assets/anims/exit.json',
              height: Get.height * .2,
              width: Get.height * .2,
            ),
            Text(
              'آیا می‌خواهید از حساب کاربریتان خارج شوید؟',
              style: TextStyle(
                color: titleTextColor,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: Get.height * .05,
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Get.back(result: 0);
                        },
                        child: Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: radiusAll12,
                            border: Border.all(
                              color: mainColor,
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: AutoSizeText(
                              'انصراف',
                              maxLines: 1,
                              maxFontSize: 26.0,
                              minFontSize: 20.0,
                              style: TextStyle(
                                color: titleTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .03,
                    ),
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Get.back(result: 1);
                        },
                        child: Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: radiusAll12,
                            color: mainColor,
                            boxShadow: shadow(),
                          ),
                          child: Center(
                            child: AutoSizeText(
                              'خروج',
                              maxLines: 1,
                              maxFontSize: 26.0,
                              minFontSize: 20.0,
                              style: TextStyle(
                                color: titleTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

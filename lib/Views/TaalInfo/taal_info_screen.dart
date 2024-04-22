import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/TaalInfo/taal_info_controller.dart';
import 'package:untitled1/Utils/widget_utils.dart';

class TaalInfoScreen extends StatelessWidget {
  TaalInfoScreen({super.key});

  final TaalInfoController controller = Get.put(TaalInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            buildAppBar(
              isInnerPage: true,
              function: () {
                Get.back();
                Get.delete<TaalInfoController>();
              },
              title: 'درباره تالبان',
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                margin: paddingAll16,
                child: Column(
                  children: [
                    animationConfig(
                      widget: Image.asset(
                        tallLogo,
                        height: Get.height * .1,
                        width: Get.height * .1,
                      ),
                      index: 2,
                    ),
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: animationConfig(
                        widget: Text(
                          'صبح یک روز آفتابیه و اسکوترهای تال توی ایستگاه، لحظه شماری می‌کنند تا نوبت سواری خودشون برسه. کم کم مسافرها از راه می‌رسند. بعضی‌هاشون عجله دارند تا زودتر به محل کارشون برسند، بعضی‌ها خسته‌تر از اون هستند که پیاده به خونه برگردند و بعضی هم از یکنواختی زندگی خسته شدن و دلشون یک تجربه‌ی متفاوت میخواد. در طول روز اسکوترهای تال بی‌وقفه توی سطح شهر جابجا می‌شن و مسافر‌ها رو تا مقصد نهایی همراهی می‌کنند. روز در حال سپری شدنه و هرکدوم از اسکوترها یه گوشه‌‌ از شهر رها شدند. بعضی از اونها شارژ باتریشون تموم شده، بعضی نیاز به تعمیر دارند و بعضی‌ها جای پارک مناسبی ندارند.و درست در همین لحظه، تال‌بان مثل یک قهرمان وارد صحنه میشه. تال‌بان اسکوترها رو جمع‌آوری میکنه و به ایستگاه برمی‌گردونه، باتری اسکوترها رو تعویض می‌کنه و اسکوترهایی که نیازمند تعمیر هستند رو به تعمیرگاه میرسونه.اپلیکیشن تال‌بان یک ابزار کاربردیست که به تال‌بان‌ها کمک می‌کنه وظایف خودشون رو با نهایت دقت و هماهنگی انجام دهند. تال‌بان عزیز، شما بازوی اجرایی تیم پشتیبانی تال هستید و ما همه در کنار هم برای یک هدف تلاش می‌کنیم: تجربه‌ی یک سواری لذت‌بخش و بدون دردسر.',
                          style: TextStyle(
                            color: titleTextColor,
                            fontSize: 16.0,
                          ),
                        ),
                        index: 3,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    Expanded(
                      child: Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: animationConfig(
                          widget: Center(
                            child: Image.asset(
                              scooterImage,
                            ),
                          ),
                          index: 4,
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

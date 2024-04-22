import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Incomes/incomes_controller.dart';
import 'package:untitled1/Utils/view_utils.dart';
import 'package:untitled1/Utils/widget_utils.dart';
import 'package:untitled1/Views/Incomes/Widgets/build_incomes_list_widget.dart';

class IncomesScreen extends StatelessWidget {
  IncomesScreen({super.key});

  final IncomesController controller = Get.put(IncomesController());

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
                Get.delete<IncomesController>();
              },
              title: 'درآمد ها',
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            animationConfig(
              widget: Container(
                padding: paddingAll8,
                margin: paddingAll16,
                decoration: BoxDecoration(
                  color: avatarBorderColor.withOpacity(.1),
                  borderRadius: radiusAll20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: Get.width * .1,
                        width: Get.width * .1,
                        decoration: BoxDecoration(
                          borderRadius: radiusAll12,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            moneyIcon,
                            height: Get.width * .07,
                            width: Get.width * .07,
                            color: avatarBorderColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          replaceFarsiNumber(moneyFormat(5000000 , toman: true)),
                          style: TextStyle(
                            color: avatarBorderColor,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'درآمد کل',
                          style: TextStyle(
                            color: avatarBorderColor,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              index: 2,
            ),
            BuildIncomesListWidget(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}

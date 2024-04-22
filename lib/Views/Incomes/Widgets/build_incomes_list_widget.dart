import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Incomes/incomes_controller.dart';
import 'package:untitled1/Models/Incomes/incomes_model.dart';
import 'package:untitled1/Utils/view_utils.dart';

class BuildIncomesListWidget extends StatelessWidget {
  BuildIncomesListWidget({super.key, required this.controller});

  final IncomesController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: paddingAll16,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: controller.incomesList.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildIncomesItem(
              incomes: controller.incomesList[index],
              index: index,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.grey[200],
            );
          },
        ),
      ),
    );
  }

  Widget _buildIncomesItem({
    required IncomesModel incomes,
    required int index,
  }) {
    String statusIconPath = '';

    switch (incomes.status) {
      case 0:
        {
          statusIconPath = chargeStatusIcon;
          break;
        }
      case 1:
        {
          statusIconPath = travelStatusIcon;
          break;
        }
      default:
        {
          statusIconPath = homeStatusIcon;
          break;
        }
    }

    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 450),
      child: SlideAnimation(
        horizontalOffset: 151.0,
        child: FadeInAnimation(
          child: Container(
            width: Get.width,
            height: Get.height * .1,
            padding: paddingAll8,
            decoration: BoxDecoration(
              borderRadius: radiusAll16,
              color: fillTextColor.withOpacity(.5),
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    statusIconPath,
                                    height: Get.width * .05,
                                    width: Get.width * .05,
                                  ),
                                  SizedBox(
                                    width: Get.width * .01,
                                  ),
                                  Text(
                                    replaceFarsiNumber(
                                      moneyFormat(
                                        double.parse(incomes.price),
                                        toman: true,
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: historyPriceColor,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            padding: paddingSymmetricH8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: double.maxFinite,
                                  padding: paddingSymmetricH12,
                                  decoration: BoxDecoration(
                                    color: (incomes.payStatus == 0)?Colors.white:historyPriceColor.withOpacity(.2),
                                    borderRadius: radiusAll50,
                                  ),
                                  child: Center(
                                    child: Text(
                                      (incomes.payStatus == 0)
                                          ? 'تسویه نشده'
                                          : 'تسویه شده',
                                      style: TextStyle(
                                        color: (incomes.payStatus == 0)
                                            ? Colors.grey.shade700
                                            : avatarBorderColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * .02,
                                ),
                                SvgPicture.asset(
                                  moneyIcon,
                                  height: Get.width * .07,
                                  width: Get.width * .07,
                                  color: Colors.grey.shade700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    25,
                    (index) => Padding(
                      padding: paddingSymmetricH2,
                      child: AutoSizeText(
                        '_',
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    padding: paddingSymmetricH8,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              replaceFarsiNumber(
                                incomes.time,
                              ),
                              style: TextStyle(
                                color: titleTextColor,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .01,
                            ),
                            SvgPicture.asset(
                              clockIcon,
                              color: Colors.grey.shade700,
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              replaceFarsiNumber(
                                incomes.date,
                              ),
                              style: TextStyle(
                                color: titleTextColor,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .01,
                            ),
                            SvgPicture.asset(
                              calendarIcon,
                              color: Colors.grey.shade700,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/History/history_controller.dart';
import 'package:untitled1/Models/History/history_model.dart';
import 'package:untitled1/Utils/view_utils.dart';

class BuildHistoryListWidget extends StatelessWidget {
  BuildHistoryListWidget({super.key, required this.controller});

  final HistoryController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: paddingAll16,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: controller.historyList.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildHistoryItem(
              history: controller.historyList[index],
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

  Widget _buildHistoryItem({
    required HistoryModel history,
    required int index,
  }) {
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
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  replaceFarsiNumber(
                                    moneyFormat(
                                      double.parse(history.price),
                                      toman: true,
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: historyPriceColor,
                                    fontSize: 20.0,
                                  ),
                                ),
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
                                SvgPicture.asset(
                                  (history.status == 0)
                                      ? chargeStatusIcon
                                      : travelStatusIcon,
                                  height: Get.width * .045,
                                  width: Get.width * .045,
                                ),
                                SizedBox(
                                  width: Get.width * .01,
                                ),
                                Text(
                                  '${replaceFarsiNumber(
                                    history.code,
                                  )}',
                                  style: TextStyle(
                                    color: titleTextColor,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * .01,
                                ),
                                SvgPicture.asset(
                                  scooterIcon,
                                  height: Get.width * .06,
                                  width: Get.width * .06,
                                )
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
                                history.time,
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
                                history.date,
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

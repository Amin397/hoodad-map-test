import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Messages/messages_controller.dart';
import 'package:untitled1/Models/Messages/messages_model.dart';
import 'package:untitled1/Utils/view_utils.dart';

class BuildMessagesListWidget extends StatelessWidget {
  BuildMessagesListWidget({super.key, required this.controller});

  final MessagesController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: paddingAll16,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: controller.messagesList.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildMessageItem(
              message: controller.messagesList[index],
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

  Widget _buildMessageItem({
    required MessagesModel message,
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
            // height: Get.height * .1,
            padding: paddingAll8,
            decoration: BoxDecoration(
              borderRadius: radiusAll16,
              color: fillTextColor.withOpacity(.5),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    tallLogo,
                    width: Get.width * .11,
                    height: Get.width * .11,
                  ),
                  SizedBox(
                    width: Get.width * .02,
                  ),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          Container(
                            padding: paddingSymmetricH8,
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  message.title,
                                  style: TextStyle(
                                    color: titleTextColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      calendarIcon,
                                      color: Colors.grey.shade700,
                                    ),
                                    SizedBox(
                                      width: Get.width * .01,
                                    ),
                                    Text(
                                      replaceFarsiNumber(
                                        message.date,
                                      ),
                                      style: TextStyle(
                                        color: titleTextColor,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    SvgPicture.asset(
                                      clockIcon,
                                      color: Colors.grey.shade700,
                                    ),
                                    SizedBox(
                                      width: Get.width * .01,
                                    ),
                                    Text(
                                      replaceFarsiNumber(
                                        message.time,
                                      ),
                                      style: TextStyle(
                                        color: titleTextColor,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          Container(
                            width: Get.width,
                            padding: paddingSymmetricH8,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                message.message,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .01,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

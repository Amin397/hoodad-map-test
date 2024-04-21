import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Home/home_controller.dart';
import 'package:untitled1/Models/Home/task_model.dart';

class BuildFilterWidget extends StatelessWidget {
  BuildFilterWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
          top: Get.height * .35,
          left: Get.width * .05,
          right: Get.width * .05,
        ),
        width: Get.width,
        height: Get.height * .13,
        padding: paddingAll12,
        decoration: BoxDecoration(
          borderRadius: radiusAll16,
          color: Colors.white,
          boxShadow: shadow(),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'نوع تسک',
                style: TextStyle(
                  color: titleTextColor,
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .015,
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  // color: Colors.grey[200],
                  border: Border.all(
                    color: Colors.grey[300]!,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0XFFE8E8E8),
                    ),
                    BoxShadow(
                      color: Color(0XFFF6F6F6),
                      spreadRadius: -12.0,
                      blurRadius: 12.0,
                    ),
                  ],
                  borderRadius: radiusAll16,
                ),
                child: Stack(
                  children: [
                    _buildBackGroundTask(),
                    Row(
                      children: [
                        _buildTaskItem(
                          task: controller.taskList.last,
                        ),
                        _buildTaskItem(
                          task: controller.taskList[1],
                        ),
                        _buildTaskItem(
                          task: controller.taskList.first,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem({
    required TaskModel task,
  }) {
    return Flexible(
      flex: 1,
      child: Obx(
        () => InkWell(
          onTap: () {
            controller.selectTask(
              task: task,
            );
          },
          child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Center(
              child: AutoSizeText(
                task.title,
                maxLines: 1,
                maxFontSize: 22.0,
                minFontSize: 18.0,
                style: TextStyle(
                  color:
                      (task.isSelected.isTrue) ? Colors.white : titleTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackGroundTask() {
    return Obx(
      () => AnimatedAlign(
        alignment: controller.taskList
            .singleWhere((element) => element.isSelected.isTrue)
            .alignment,
        duration: const Duration(milliseconds: 170),
        child: Container(
          height: double.maxFinite,
          width: Get.width * .25,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: radiusAll12,
            // boxShadow: (task.isSelected.isTrue) ? shadow() : [],
          ),
          margin: paddingAll4,
        ),
      ),
    );
  }
}

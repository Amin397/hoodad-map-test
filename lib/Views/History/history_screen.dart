import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controllers/History/history_controller.dart';
import 'package:untitled1/Utils/widget_utils.dart';
import 'package:untitled1/Views/History/Widgets/build_history_list_widget.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final HistoryController controller = Get.put(HistoryController());

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
                Get.delete<HistoryController>();
              },
              title: 'تاریخچه',
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            BuildHistoryListWidget(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}

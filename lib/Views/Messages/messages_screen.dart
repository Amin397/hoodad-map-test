import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controllers/Messages/messages_controller.dart';
import 'package:untitled1/Utils/widget_utils.dart';
import 'package:untitled1/Views/Messages/Widgets/build_messages_list_widget.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});

  final MessagesController controller = Get.put(MessagesController());

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
                Get.delete<MessagesController>();
              },
              title: 'پیام ها',
            ),
            SizedBox(
              height: Get.height * .03,
            ),
            BuildMessagesListWidget(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}

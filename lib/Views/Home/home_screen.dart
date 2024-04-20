import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Home/home_controller.dart';
import 'package:untitled1/Views/Home/Widgets/build_filter_widget.dart';
import 'package:untitled1/Views/Home/Widgets/build_home_bottom_widget.dart';
import 'package:untitled1/Views/Home/Widgets/build_map_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            BuildMapWidget(controller: controller),
            BuildHomeBottomWidget(
              controller: controller,
            ),
            _buildTopWidgets(),
            Obx(
              () => (controller.isFilterOn.isTrue)
                  ? BuildFilterWidget(
                      controller: controller,
                    )
                  : SizedBox(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTopWidgets() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: Get.width,
        height: Get.height * .12,
        padding: EdgeInsets.only(
          top: Get.height * .025,
          left: Get.width * .05,
          right: Get.width * .05,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width * .11,
              height: Get.width * .11,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: shadow(),
                color: Colors.white,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/Icons/menuIcon.svg',
                  height: Get.width * .07,
                  width: Get.width * .07,
                ),
              ),
            ),
            Container(
              width: Get.width * .15,
              height: Get.width * .15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: shadow(),
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  color: mainColor,
                  size: 40.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

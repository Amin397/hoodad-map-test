import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/icons_path.dart';
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
            BuildMapWidget(
              controller: controller,
            ),
            BuildHomeBottomWidget(
              controller: controller,
            ),
            _buildTopWidgets(),
            Obx(
              () => AnimatedSwitcher(
                duration: Duration(milliseconds: 300), // Animation duration
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: (controller.isFilterOn.isTrue)
                    ? BuildFilterWidget(
                        controller: controller,
                      )
                    : SizedBox(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTopWidgets() {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: (){
          controller.goToMenu();
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * .05,
            vertical: Get.height * .04,
          ),
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
            child: ClipRRect(
              borderRadius: radiusAll100,
              child: Image.asset(
                avatarLogo,
                fit: BoxFit.cover,
                width: Get.width * .15,
                height: Get.width * .15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

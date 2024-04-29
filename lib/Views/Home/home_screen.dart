import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/Blocs/blocs_utils.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Home/home_controller.dart';
import 'package:untitled1/Utils/API/base_http_request_utils.dart';
import 'package:untitled1/Utils/routs_utils.dart';
import 'package:untitled1/Views/Home/Widgets/build_filter_widget.dart';
import 'package:untitled1/Views/Home/Widgets/build_home_bottom_widget.dart';
import 'package:untitled1/Views/Home/Widgets/build_home_top_widget.dart';
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
            BuildHomeTopWidget(
              controller: controller,
            ),
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
}

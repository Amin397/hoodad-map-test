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
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              controller.goToMenu();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * .05,
                vertical: Get.height * .04,
              ),
              width: Get.width * .12,
              height: Get.width * .12,
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
                child: SvgPicture.asset(
                  menuIcon,
                  height: Get.width * .06,
                  width: Get.width * .06,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Get.toNamed(NameRouts.profile);
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
                child: Hero(
                  tag: 'ProfilePicture',
                  child: StreamBuilder(
                    stream: Blocs.infoBloc.getStream,
                    builder: (c, x) {
                      return Center(
                        child: (Blocs.infoBloc.info!.nationalCardImage is String &&
                            Blocs.infoBloc.info!.nationalCardImage!.length > 3)
                            ? ClipRRect(
                          borderRadius: radiusAll100,
                          child: CachedNetworkImage(
                            imageUrl: BaseHttpRequest.baseFileRequestUrl +
                                '/' +
                                Blocs.infoBloc.info!.nationalCardImage!,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Lottie.asset(
                              'assets/anims/imageLoading.json',
                            ),
                            width: Get.width * .15,
                            height: Get.width * .15,
                          ),
                        )
                            : ClipRRect(
                          borderRadius: radiusAll100,
                          child: Image.asset(
                            avatarLogo,
                            width: Get.width * .15,
                            height: Get.width * .15,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/Blocs/blocs_utils.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Home/home_controller.dart';
import 'package:untitled1/Utils/API/base_http_request_utils.dart';
import 'package:untitled1/Utils/routs_utils.dart';

class BuildHomeTopWidget extends StatelessWidget {
  BuildHomeTopWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              controller.goToMenu();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * .05,
                vertical: Get.height * .04,
              ),
              width: Get.width * .11,
              height: Get.width * .11,
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
          // _buildTopSwitcher(),
          InkWell(
            onTap: () {
              Get.toNamed(NameRouts.profile);
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * .05,
                vertical: Get.height * .04,
              ),
              width: Get.width * .14,
              height: Get.width * .14,
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
                        child: (Blocs.infoBloc.info!.nationalCardImage
                                    is String &&
                                Blocs.infoBloc.info!.nationalCardImage!.length >
                                    3)
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

  Widget _buildTopSwitcher() {
    return Container(
      width: Get.width * .4,
      height: Get.height * .045,
      decoration: BoxDecoration(
        borderRadius: radiusAll50,
        color: Colors.white,
        boxShadow: shadow(),
      ),
      child: Obx(
        () => Stack(
          children: [
            Center(
              child: Container(
                width: Get.width * .4,
                height: Get.height * .045,
                margin: paddingAll2,
                decoration: BoxDecoration(
                  borderRadius: radiusAll50,
                  color: Color(0XFFE8E8E8).withOpacity(.2),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0XFFE8E8E8).withOpacity(.8),
                    ),
                    BoxShadow(
                      color: Color(0XFFF6F6F6),
                      spreadRadius: -8.0,
                      blurRadius: 8.0,
                    ),
                  ],
                ),
              ),
            ),
            AnimatedAlign(
              alignment: (controller.isCollect.isTrue)
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: Get.width * .2,
                height: Get.height * .045,
                margin: paddingAll4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadow(),
                  borderRadius: radiusAll50,
                ),
              ),
            ),
            Center(
              child: Container(
                width: Get.width * .4,
                height: Get.height * .045,
                margin: paddingAll2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        controller.switchCollect(collect:false,);
                      },
                      child: Text(
                        'قرار دادن',
                        style: TextStyle(
                          color: titleTextColor,
                          fontWeight: (controller.isCollect.isTrue)?FontWeight.w500:FontWeight.bold,
                          fontSize:(controller.isCollect.isTrue)? 14.0:16.0,
                          shadows: (controller.isCollect.isTrue)?[]:shadow(),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        controller.switchCollect(collect:true,);
                      },
                      child: Text(
                        'جمع کردن',
                        style: TextStyle(
                          color: titleTextColor,
                          fontWeight: (controller.isCollect.isTrue)?FontWeight.bold:FontWeight.w500,
                          fontSize:(controller.isCollect.isTrue)? 16.0:14.0,
                          shadows: (controller.isCollect.isTrue)?shadow():[],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

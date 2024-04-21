import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/Profile/profile_controller.dart';
import 'package:untitled1/Utils/view_utils.dart';
import 'package:untitled1/Utils/widget_utils.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

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
                Get.delete<ProfileController>();
              },
              title: 'حساب کاربری',
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                margin: paddingAll16,
                child: Column(
                  children: [
                    animationConfig(
                      widget: _buildProfileAvatar(),
                      index: 2,
                    ),
                    SizedBox(
                      height: Get.height * .02,
                    ),
                    animationConfig(
                      widget: Text(
                        'محمد امین خادمی',
                        style: TextStyle(
                          color: titleTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      index: 2,
                    ),
                    animationConfig(
                      widget: Text(
                        replaceFarsiNumber(
                          '09383974483',
                        ),
                        style: TextStyle(
                          color: titleTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      index: 2,
                    ),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    _buildProfileLog(),
                    SizedBox(
                      height: Get.height * .03,
                    ),
                    animationConfig(
                      widget: _buildProfileItem(
                        id: 0,
                        iconPath: profileIcon,
                        title: 'اطلاعات کاربری',
                        withShadow: true,
                        baseColor: mainColor,
                      ),
                      index: 3,
                    ),
                    animationConfig(
                      widget: _buildProfileItem(
                        id: 1,
                        iconPath: chatIcon,
                        title: 'پیام‌ها',
                        withShadow: true,
                        baseColor: mainColor,
                      ),
                      index: 4,
                    ),
                    animationConfig(
                      widget: _buildProfileItem(
                        id: 1,
                        iconPath: logOutIcon,
                        title: 'خروج از حساب',
                        withShadow: false,
                        baseColor: Colors.red,
                      ),
                      index: 5,
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

  Widget _buildProfileItem({
    required String iconPath,
    required String title,
    required int id,
    required bool withShadow,
    required Color baseColor,
  }) {
    return InkWell(
      onTap: () {
        controller.goToPage(
          id: id,
        );
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: radiusAll16,
      ),
      child: Container(
        width: Get.width,
        height: Get.height * .06,
        padding: paddingSymmetricH8,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:(withShadow)? shadow(
            offset: Offset(0.0, 3.0),
          ):[],
          borderRadius: radiusAll12,
        ),
        margin: paddingSymmetricV8,
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey,
              size: 20.0,
            ),
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: titleTextColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * .05,
            ),
            Container(
              height: Get.width * .1,
              width: Get.width * .1,
              decoration: BoxDecoration(
                borderRadius: radiusAll12,
                color: baseColor.withOpacity(.15),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  height: Get.width * .06,
                  width: Get.width * .06,
                  color: baseColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Container(
      width: Get.width * .4,
      height: Get.width * .4,
      child: Stack(
        children: [
          SizedBox(
            width: Get.width * .4,
            height: Get.width * .4,
            child: CircularProgressIndicator(
              value: .65,
              strokeWidth: 3.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                avatarBorderColor,
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: radiusAll100,
              child: Image.asset(
                avatarLogo,
                fit: BoxFit.cover,
                width: Get.width * .38,
                height: Get.width * .38,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileLog() {
    return Container(
      width: Get.width,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: animationConfig(
              widget: Container(
                padding: paddingAll8,
                decoration: BoxDecoration(
                  color: searchBorderColor.withOpacity(.1),
                  borderRadius: radiusAll20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: Get.width * .1,
                        width: Get.width * .1,
                        decoration: BoxDecoration(
                          borderRadius: radiusAll12,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            mapRoutIcon,
                            height: Get.width * .07,
                            width: Get.width * .07,
                            color: searchBorderColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          replaceFarsiNumber('120'),
                          style: TextStyle(
                            color: searchBorderColor,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'تعداد کل سرویس‌ها',
                          style: TextStyle(
                            color: searchBorderColor,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              index: 4,
            ),
          ),
          SizedBox(
            width: Get.width * .02,
          ),
          Flexible(
            flex: 1,
            child: animationConfig(
              widget: Container(
                padding: paddingAll8,
                decoration: BoxDecoration(
                  color: avatarBorderColor.withOpacity(.1),
                  borderRadius: radiusAll20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: Get.width * .1,
                        width: Get.width * .1,
                        decoration: BoxDecoration(
                          borderRadius: radiusAll12,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            moneyIcon,
                            height: Get.width * .07,
                            width: Get.width * .07,
                            color: avatarBorderColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'تومان',
                              style: TextStyle(
                                color: avatarBorderColor,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              '  5,000,000',
                              style: TextStyle(
                                color: avatarBorderColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'درآمد کل',
                          style: TextStyle(
                            color: avatarBorderColor,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              index: 3,
            ),
          ),
        ],
      ),
    );
  }
}

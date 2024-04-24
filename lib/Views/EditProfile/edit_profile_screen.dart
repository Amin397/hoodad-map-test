import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/icons_path.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/EditProfile/edit_profile_controller.dart';
import 'package:untitled1/Utils/widget_utils.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final EditProfileController controller = Get.put(EditProfileController());

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
                Get.delete<EditProfileController>();
              },
              title: 'حساب کاربری',
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                margin: paddingAll16,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      animationConfig(
                        widget: _buildProfileAvatar(),
                        index: 2,
                      ),
                      SizedBox(
                        height: Get.height * .05,
                      ),
                      animationConfig(
                        widget: filledTextField(
                          controller: controller.firstNameTextController,
                          label: 'نام',
                          textStyle: TextStyle(
                            fontSize: 18.0,
                            color: searchBorderColor,
                          ),
                          textAlign: TextAlign.right,
                          maxLine: 1,
                        ),
                        index: 2,
                      ),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      animationConfig(
                        widget: filledTextField(
                          controller: controller.lastNameTextController,
                          label: 'نام خانوادگی',
                          textStyle: TextStyle(
                            fontSize: 18.0,
                            color: searchBorderColor,
                          ),
                          textAlign: TextAlign.right,
                          maxLine: 1,
                        ),
                        index: 2,
                      ),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      animationConfig(
                        widget: filledTextField(
                          controller: controller.phoneNumberTextController,
                          label: 'شماره موبایل',
                          textStyle: TextStyle(
                            fontSize: 18.0,
                            color: searchBorderColor,
                          ),
                          textAlign: TextAlign.right,
                          maxLine: 1,
                          inputType: TextInputType.number,
                          maxLength: 11,
                        ),
                        index: 2,
                      ),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      animationConfig(
                        widget: filledTextField(
                          controller: controller.nationalCodeTextController,
                          label: 'کد ملی',
                          textStyle: TextStyle(
                            fontSize: 18.0,
                            color: searchBorderColor,
                          ),
                          textAlign: TextAlign.right,
                          maxLine: 1,
                          inputType: TextInputType.number,
                          maxLength: 10,
                        ),
                        index: 3,
                      ),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      animationConfig(
                        widget: filledTextField(
                          controller: controller.emailTextController,
                          label: 'ایمیل',
                          textStyle: TextStyle(
                            fontSize: 18.0,
                            color: searchBorderColor,
                          ),
                          textAlign: TextAlign.right,
                          maxLine: 1,
                          inputType: TextInputType.emailAddress,
                        ),
                        index: 3,
                      ),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      animationConfig(
                        widget: _buildGenderPart(),
                        index: 4,
                      ),
                      SizedBox(
                        height: Get.height * .05,
                      ),
                      animationConfig(
                        widget: _buildSaveButton(),
                        index: 5,
                      ),
                      SizedBox(
                        height: Get.height * .05,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Container(
      width: Get.width * .4,
      height: Get.width * .4,
      child: InkWell(
        onTap: () {
          controller.openImageModal();
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: radiusAll80,
        ),
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
              // child: ClipRRect(
              //   borderRadius: radiusAll100,
              //   child: Image.asset(
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: Get.width * .11,
                width: Get.width * .11,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: mainColor,
                  boxShadow: shadow(),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    cameraIcon,
                    height: Get.width * .055,
                    width: Get.width * .055,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGenderPart() {
    return Container(
      width: Get.width,
      height: Get.height * .06,
      child: GetBuilder(
        init: controller,
        id: 'changeGender',
        builder: (ctx) {
          return Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  padding: paddingSymmetricH16,
                  decoration: BoxDecoration(
                    borderRadius: radiusAll16,
                    color: fillTextColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'زن',
                        style: TextStyle(
                          color: titleTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      Radio(
                        value: 2,
                        groupValue: ctx.genderGroupValue,
                        onChanged: (value) {
                          controller.selectGender(value: value!);
                        },
                        activeColor: mainColor,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * .05,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  padding: paddingSymmetricH16,
                  decoration: BoxDecoration(
                    borderRadius: radiusAll16,
                    color: fillTextColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'مرد',
                        style: TextStyle(
                          color: titleTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      Radio(
                        value: 1,
                        groupValue: ctx.genderGroupValue,
                        onChanged: (value) {
                          controller.selectGender(value: value!);
                        },
                        activeColor: mainColor,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSaveButton() {
    return InkWell(
      onTap: () {
        controller.saveEditProfile();
      },
      child: Container(
        width: Get.width * .9,
        height: Get.height * .06,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: radiusAll16,
          boxShadow: shadow(),
        ),
        child: Center(
          child: AutoSizeText(
            'ذخیره',
            maxFontSize: 26.0,
            minFontSize: 20.0,
            maxLines: 1,
            style: TextStyle(
              color: titleTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}



// child: (Blocs.infoBloc.info!.user!.avatar is String &&
// Blocs.infoBloc.info!.user!.avatar!.length > 3)
// ? ClipRRect(
// borderRadius: radiusAll100,
// child: CachedNetworkImage(
// imageUrl: BaseHttpRequest.baseFileRequestUrl +
// '/' +
// Blocs.infoBloc.info!.!.avatar!,
// fit: BoxFit.cover,
// placeholder: (context, url) => Lottie.asset(
// 'assets/anims/imageLoading.json',
// ),
// ),
// )
//     : Center(
// child: ClipRRect(
// borderRadius: radiusAll100,
// child: Image.asset(
// avatarLogo,
// width: Get.width * .38,
// height: Get.width * .38,
// ),
// ),
// ),
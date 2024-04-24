import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/Blocs/blocs_utils.dart';
import 'package:untitled1/Consts/error_code.dart';
import 'package:untitled1/Models/User/user_info_model.dart';
import 'package:untitled1/Utils/API/project_requests_utils.dart';
import 'package:untitled1/Utils/view_utils.dart';
import 'package:untitled1/Utils/widget_utils.dart';

class EditProfileController extends GetxController {
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController nationalCodeTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  ProjectRequestsUtils requests = ProjectRequestsUtils();

  bool hasImage = false;
  XFile? pickedImage;

  int? genderGroupValue;

  void selectGender({required int value}) {
    genderGroupValue = value;
    update(['changeGender']);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  initData() {
    firstNameTextController.text = Blocs.infoBloc.info!.name!;
    lastNameTextController.text = Blocs.infoBloc.info!.family!;
    phoneNumberTextController.text = Blocs.infoBloc.info!.mobile!;
    nationalCodeTextController.text = Blocs.infoBloc.info!.nationalCode!;
    genderGroupValue = Blocs.infoBloc.info!.gender;
  }

  void saveEditProfile() async {
    showLoadingAlert();
    requests
        .editProfile(
      name: firstNameTextController.text,
      family: lastNameTextController.text,
      email: emailTextController.text,
      gender: genderGroupValue!,
      image: (pickedImage is XFile) ? File(pickedImage!.path) : null,
    )
        .then(
      (value) async {
        Get.back();

        Map<String, dynamic> apiResult = jsonDecode(value!.body);

        if (apiResult['errorCode'] == null) {
          await updateUserData();
          showSuccessSnakeBar(
            body: apiResult['result']['message'],
          );
        } else {
          showErrorSnakeBar(
            body: errorList
                .singleWhere(
                    (element) => element.code == apiResult['errorCode'])
                .message,
          );
        }
      },
    );
  }

  Future<void> updateUserData() async {
    requests.getUserInfo().then((value) async {
      Map<String, dynamic> apiResult = jsonDecode(value!.body);

      if (apiResult['errorCode'] == null) {
        Blocs.infoBloc.setData(
          infoData: UserInfoModel.fromJson(
            apiResult['result'],
          ),
        );
      }
    });
  }

  void openImageModal() async {
    FocusManager.instance.primaryFocus?.unfocus();
    var result = await myImageModal(
      context: Get.context!,
      // hasImage: hasImage,
    );

    if (result is int) {
      _deleteImage();
    } else {
      pickedImage = result;
      // await uploadImage();
    }

    update(['personalAvatar']);
  }

  void _deleteImage() {
    hasImage = false;
    update(['personalAvatar']);
  }
}

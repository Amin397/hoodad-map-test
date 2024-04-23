import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled1/Blocs/blocs_utils.dart';
import 'package:untitled1/Utils/API/project_requests_utils.dart';

class EditProfileController extends GetxController {
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController nationalCodeTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  ProjectRequestsUtils requests = ProjectRequestsUtils();

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
    requests
        .editProfile(
          name: firstNameTextController.text,
          family: lastNameTextController.text,
          email: emailTextController.text,
          gender: genderGroupValue!,
          image: '',
        )
        .then(
          (value) {},
        );
  }
}

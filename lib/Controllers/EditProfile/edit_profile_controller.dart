import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController{
  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController nationalCodeTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  int? genderGroupValue;

  void selectGender({required int value}) {
    genderGroupValue = value;

    update(['changeGender']);
  }






}
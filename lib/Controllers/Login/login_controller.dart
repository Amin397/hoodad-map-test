import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  bool isNumberEntered = false;

  TextEditingController phoneNumberTextController = TextEditingController();



  changeLoginStatus(){
    isNumberEntered = true;
    update(['loginSwitcher']);
  }
}
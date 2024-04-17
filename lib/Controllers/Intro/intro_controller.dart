import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled1/Models/Intro/intro_model.dart';
import 'package:untitled1/Utils/routs_utils.dart';

class IntroController extends GetxController {
  RxInt currentIndex = 0.obs;

  late PageController pageController;

  List<IntroModel> introList = [
    IntroModel(
      id: 0,
      image: 'assets/images/Intro/intro1.png',
      title: 'تال‌ها رو پیدا کن',
      alignment: Alignment.center,
    ),
    IntroModel(
      id: 1,
      image: 'assets/images/Intro/intro2.png',
      title: 'بارکد تال رو اسکن کن',
      alignment: Alignment.centerRight,
    ),
    IntroModel(
      id: 2,
      image: 'assets/images/Intro/intro3.png',
      title: 'تال‌هارو در زمان تعیین شده جابجا کن ',
      alignment: Alignment.centerLeft,
    ),
    IntroModel(
      id: 3,
      image: 'assets/images/Intro/intro4.png',
      title: 'بابت هر تال هزینه دریافت کن',
      alignment: Alignment.centerRight,
    ),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: currentIndex.value);
    super.onInit();
  }

  void changePage({required int page}) {
    currentIndex(page);
  }

  void goToLogin() {
    Get.offAllNamed(NameRouts.login);
  }
}

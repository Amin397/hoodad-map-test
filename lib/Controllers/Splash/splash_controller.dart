import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled1/Blocs/blocs_utils.dart';
import 'package:untitled1/Models/User/user_info_model.dart';
import 'package:untitled1/Utils/API/project_requests_utils.dart';
import 'package:untitled1/Utils/routs_utils.dart';
import 'package:untitled1/Utils/storage_utils.dart';

class SplashController extends GetxController {
  ProjectRequestsUtils requests = ProjectRequestsUtils();
  RxDouble containerOneW = (Get.width * .2).obs;
  RxDouble containerTwoW = (Get.width * .45).obs;
  bool revers = false;
  bool revers2 = false;

  Timer? timer1;
  Timer? timer2;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    timer1 = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (!revers) {
        containerOneW.value = containerOneW.value + (Get.width * .05);
        if (containerOneW.value == Get.width * .7) {
          revers = true;
        }
      } else {
        containerOneW.value = containerOneW.value - (Get.width * .05);
        if (containerOneW.value <= Get.width * .2) {
          revers = false;
        }
      }
    });

    timer2 = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (!revers2) {
        containerTwoW.value = containerTwoW.value + (Get.width * .05);
        if (containerTwoW.value >= Get.width * .85) {
          revers2 = true;
        }
      } else {
        containerTwoW.value = containerTwoW.value - (Get.width * .05);
        if (containerTwoW.value <= Get.width * .1) {
          revers2 = false;
        }
      }
    });
    checkUserExist();
  }

  Future<void> checkUserExist() async {
    if (!await Permission.location.status.isGranted) {
      await Permission.location.request();
    }

    StorageUtils.getToken().then((value) {
      if (value is String) {
        getUserInfo();
      } else {
        Future.delayed(const Duration(seconds: 7), () {
          Get.offAllNamed(NameRouts.intro);
        });
      }
    });
  }

  Future<void> getUserInfo() async {
    requests.getUserInfo().then((value) async {
      Map<String, dynamic> apiResult = jsonDecode(value!.body);

      if (apiResult['errorCode'] == null) {
        Blocs.infoBloc.setData(
          infoData: UserInfoModel.fromJson(
            apiResult['result'],
          ),
        );
        Future.delayed(const Duration(seconds: 3), () {
          Get.offAllNamed(NameRouts.home);
          Get.delete<SplashController>();
        });
      }
    });
  }

  @override
  void onClose() {
    timer1!.cancel();
    timer2!.cancel();
    super.onClose();
  }
}

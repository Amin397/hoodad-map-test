import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Controllers/Login/login_controller.dart';
import 'package:untitled1/Views/Login/Widgets/build_number_login_widget.dart';
import 'package:untitled1/Views/Login/Widgets/build_otp_code_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            _buildBg(),
            _buildLoginContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildBg() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: Get.width,
        height: Get.height * .65,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/login.png',
              width: Get.width,
              height: Get.height * .65,
              fit: BoxFit.cover,
            ),
            Container(
              width: Get.width,
              height: Get.height * .65,
              decoration: BoxDecoration(
                color: loginShadowColor.withOpacity(.8),
              ),
            ),
            Center(
              child: SvgPicture.asset(
                'assets/images/logoTall.svg',
                height: Get.height * .05,
                width: Get.height * .05,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLoginContent() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Get.width,
        height: Get.height * .5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
        ),
        child: GetBuilder(
          init: controller,
          id: 'loginSwitcher',
          builder: (ctx) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 500), // Animation duration
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: (ctx.isNumberEntered)
                  ? BuildOtpCodeWidget(
                      controller: controller,
                    )
                  : BuildNumberLoginWidget(
                      controller: controller,
                    ),
            );
          },
        ),
      ),
    );
  }
}

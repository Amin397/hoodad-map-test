import 'package:get/get.dart';
import 'package:untitled1/Views/Intro/intro_screen.dart';
import 'package:untitled1/Views/Login/login_screen.dart';
import 'package:untitled1/Views/SetRout/set_rout_screen.dart';
import 'package:untitled1/Views/Splash/splash_screen.dart';


class NameRouts{
  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String login = '/login';
  static const String setRout = '/setRout';
  static const String homeMap = '/homeMap';
}

class PageRout {
  static List<GetPage> pages = [
    GetPage(
        name: NameRouts.splash,
        page: () => SplashScreen(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.intro,
        page: () => IntroScreen(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.setRout,
        page: () => SetRoutScreen(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.login,
        page: () => LoginScreen(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500)
    ),
  ];
}
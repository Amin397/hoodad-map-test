import 'package:get/get.dart';
import 'package:untitled1/Views/SetRout/set_rout_screen.dart';
import 'package:untitled1/Views/Splash/splash_screen.dart';


class NameRouts{
  static const String splash = '/splash';
  static const String setRout = '/setRout';
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
        name: NameRouts.setRout,
        page: () => SetRoutScreen(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500)
    ),
  ];
}
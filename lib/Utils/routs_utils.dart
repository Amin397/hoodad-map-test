import 'package:get/get.dart';
import 'package:untitled1/Views/EditProfile/edit_profile_screen.dart';
import 'package:untitled1/Views/History/history_screen.dart';
import 'package:untitled1/Views/Home/home_screen.dart';
import 'package:untitled1/Views/Incomes/incomes_screen.dart';
import 'package:untitled1/Views/Intro/intro_screen.dart';
import 'package:untitled1/Views/Login/login_screen.dart';
import 'package:untitled1/Views/MapSearch/map_search_screen.dart';
import 'package:untitled1/Views/Menu/menu_screen.dart';
import 'package:untitled1/Views/Messages/messages_screen.dart';
import 'package:untitled1/Views/Profile/profile_screen.dart';
import 'package:untitled1/Views/SetRout/set_rout_screen.dart';
import 'package:untitled1/Views/Splash/splash_screen.dart';
import 'package:untitled1/Views/TaalInfo/taal_info_screen.dart';


class NameRouts{
  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String login = '/login';
  static const String setRout = '/setRout';
  static const String home = '/home';
  static const String search = '/search';
  static const String menu = '/menu';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String history = '/history';
  static const String incomes = '/incomes';
  static const String taalInfo = '/taalInfo';
  static const String messages = '/messages';
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
    GetPage(
        name: NameRouts.home,
        page: () => HomeScreen(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.search,
        page: () => MapSearchScreen(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.menu,
        page: () => MenuScreen(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.profile,
        page: () => ProfileScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.editProfile,
        page: () => EditProfileScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.history,
        page: () => HistoryScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.incomes,
        page: () => IncomesScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.taalInfo,
        page: () => TaalInfoScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.messages,
        page: () => MessagesScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)
    ),
  ];
}
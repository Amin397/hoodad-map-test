import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Utils/routs_utils.dart';

void main()async{


  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PageRout.pages,
      initialRoute: NameRouts.splash,
      // home: SplashScreen(),
      title: 'Test Map',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Colors.black,
          ),
        ),
        canvasColor: Colors.white,
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
    ),
  );
}
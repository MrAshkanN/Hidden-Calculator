import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_app/View/home.dart';
import 'package:hidden_app/View/setup.dart';
import 'package:hidden_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hidden Calculator',
      textDirection: TextDirection.rtl,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.background),
          useMaterial3: true,
          fontFamily: 'shabnam',
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
              bodyMedium: TextStyle(color: Colors.black, fontSize: 18)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.background,
                  textStyle:
                      const TextStyle(color: Colors.white, fontSize: 20)))),
      initialRoute: '/setup',
      getPages: [
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/setup', page: () => Setup())
      ],
    );
  }
}

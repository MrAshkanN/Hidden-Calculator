import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_app/View/home.dart';
import 'package:hidden_app/View/setup.dart';
import 'package:hidden_app/utils/colors.dart';
import 'package:hidden_app/utils/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences share = await Share().shareInstance;
  final String? password = share.getString('password');
  bool homePage = true;
  if(password == null || password == ''){
     homePage = false;
  }
  runApp(MyApp(homePage: homePage,));
}

class MyApp extends StatelessWidget {
  final bool homePage;
  const MyApp({super.key, this.homePage = false});

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
      initialRoute: homePage ? '/home' : '/setup',
      getPages: [
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/setup', page: () => Setup())
      ],
    );
  }
}

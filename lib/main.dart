import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_app/View/home.dart';
import 'package:hidden_app/View/setup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      textDirection: TextDirection.rtl,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'shabnam',
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
              bodyMedium: TextStyle(color: Colors.black, fontSize: 18))),
      initialRoute: '/setup',
      getPages: [
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/setup', page: () => const Setup())
      ],
    );
  }
}

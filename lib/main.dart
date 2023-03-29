import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/TBRootScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData newTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: newTheme,
      home: const ThanksBoxScreen(),
    );
  }
}

import 'package:ffmovie/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
import 'package:ffmovie/movies/list/list.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: SizedBox(
          width: 200,
          height: 50,
          child: Lottie.asset(
            "assets/json/logo.json",
          )
        ),
      ),
      body: ListScreen(),
    );
  }
}

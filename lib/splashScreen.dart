// // ignore_for_file: file_names, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, annotate_overrides, file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.red.shade900,
          Colors.red.shade900,
        ],
      )),
      child: Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                "assets/bbc news.jpg",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

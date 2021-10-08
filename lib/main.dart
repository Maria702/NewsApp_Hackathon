import 'package:flutter/material.dart';
import 'package:test/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BBC NEWS',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

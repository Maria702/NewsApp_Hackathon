// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class FaviroteScreen extends StatefulWidget {
  const FaviroteScreen({Key? key}) : super(key: key);

  @override
  _FaviroteScreenState createState() => _FaviroteScreenState();
}

class _FaviroteScreenState extends State<FaviroteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        child: Center(
            child: Text(
          "No Favorite Item yet!",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

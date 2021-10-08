// ignore_for_file: file_names

import 'dart:html';

import 'package:flutter/material.dart';

class MyNewsScreen extends StatefulWidget {
  const MyNewsScreen({Key? key}) : super(key: key);

  @override
  _MyNewsScreenState createState() => _MyNewsScreenState();
}

class _MyNewsScreenState extends State<MyNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: [
              Icon(Icons.add, color: Colors.red.shade900),
              Text('Add Topic to',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Text(' create your own personal news feed'),
              Column(
                children: [
                  Text(
                      "All the latest stone from your topic will appaer here."),
                ],
              ),
              Column(children: [
                ElevatedButton(
                    onPressed: () {}, child: Text("OK, Lets Get Started"))
              ])
            ],
          ),
        ),
      ),
    );
  }
}

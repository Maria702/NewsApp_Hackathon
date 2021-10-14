// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/AuthenScreen/favScreen.dart';
import 'package:test/AuthenScreen/login.dart';
import 'package:test/AuthenScreen/signUp.dart';

class LoginScreen extends StatelessWidget {
  void main() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Login',
            theme: ThemeData(
              primarySwatch: Colors.red,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Login(),
            routes: {
              "/login": (content) => Login(),
              "/SignUp": (content) => SignUp(),
              "/home": (content) => FaviroteScreen(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}

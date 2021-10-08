// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/home.dart';
import 'package:test/login.dart';
import 'package:test/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
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
            title: 'Favirote',
            theme: ThemeData(
              primarySwatch: Colors.red,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Login(),
            routes: {
              "/login": (content) => Login(),
              "/SignUp": (content) => SignUp(),
              "/home": (content) => HomeScreen(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}

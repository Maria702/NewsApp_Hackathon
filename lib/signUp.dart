// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 80, right: 80, top: 30),
                    child: Column(
                      children: [
                        TextFormField(
                          // controller: usernameController,
                          decoration: InputDecoration(
                            hintText: "Enter user name",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(00),
                              child: Icon(Icons.usb_rounded),
                            ),
                          ),
                        ),
                        TextFormField(
                          // controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Enter Email Id",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(00),
                              child: Icon(Icons.email),
                            ),
                          ),
                        ),
                        TextFormField(
                          // controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(00),
                              child: Icon(Icons.lock),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Login()));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.teal[300],
                                onPrimary: Colors.deepOrangeAccent[50],
                                onSurface: Colors.deepPurple,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            child: Text(
                              'SignUp',
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

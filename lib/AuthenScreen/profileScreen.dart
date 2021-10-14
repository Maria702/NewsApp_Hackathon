// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/AuthenScreen/signUp.dart';
import 'package:test/home.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var data;
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential user;

    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      print("uid" + currentUser.uid);
      print(currentUser.email);
      print(currentUser);
      print(currentUser.metadata.creationTime);
    }
    @override
    Future<void> initState() async {
      super.initState();
      DocumentSnapshot snapshot =
          await db.collection('users').doc(currentUser!.uid).get();

      print("snap =====> ${snapshot["snap"]}");
    }

    getdata() async {
      var uid = currentUser!.uid;
      print(uid);
      if (uid == null) {
        print("no user");
      } else {
        DocumentSnapshot snapshot = await db.collection('user').doc(uid).get();
        final data = snapshot.data();
        print(data);
      }
    }

//*****************Log OUT************** */
    Future<void> signOut() async {
      if (FirebaseAuth.instance != null) {
        // wrong call in wrong place!
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      await _auth.signOut().then((value) => Navigator.of(context)
        ..pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignUp()),
            (route) => false));
      print("logout successfully!");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("LoggOut Successfully!"),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Email ID :",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      // "ok",
                      ("${currentUser!.email}"),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 2),
                        child: Icon(Icons.edit)),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Date & Time:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      // "ok",
                      ("${currentUser.metadata.creationTime}"),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 2),
                        child: Icon(Icons.edit)),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: signOut,
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                          ),
                        ),
                        child: Text(
                          'LogOut',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/AuthenScreen/profileScreen.dart';
import 'package:test/MultiScreen/MyNews.dart';
import 'package:test/MultiScreen/Popular.dart';
import 'package:test/MultiScreen/TopStories.dart';
import 'package:test/MultiScreen/WorldNews.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      print(currentUser.email);
      print(currentUser.providerData);
    }
    @override
    Future<void> initState() async {
      super.initState();
      DocumentSnapshot snapshot =
          await db.collection('users').doc(currentUser!.uid).get();
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    Image.asset(
                      "assets/Logo.png",
                      fit: BoxFit.contain,
                      height: 50,
                    ),
                  ],
                ),
                backgroundColor: Colors.red.shade900,
                actions: <Widget>[
                  Container(
                    child: Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.search,
                            size: 26.0,
                          ),
                        )),
                  ),

// // ***********************PopupMenuItem**************************

                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Profile"),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Settungs"),
                          value: 2,
                        ),
                        PopupMenuItem(
                          child: Text("Help"),
                          value: 3,
                        ),
                        PopupMenuItem(
                          child: Text("Contact Us"),
                          value: 4,
                        ),
                        PopupMenuItem(
                          child: Text("Other BBC apps"),
                          value: 5,
                        ),
                      ],
                      onSelected: (int menu) {
                        if (menu == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                        } else if (menu == 2) {}
                      },
                    ),
                  )
                ],

// // *****************BOTTOM TABBAR******************************

                bottom: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white30,
                    labelColor: Colors.white,
                    // indicatorColor: Colors.teal,
                    indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(50), // Creates border
                        color: Colors.red.shade700),
                    tabs: [
                      Container(
                        width: 100,
                        child: Tab(
                            child: Text(
                          'Top Stories',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                      Container(
                        width: 100,
                        child: Tab(
                            child: Text(
                          'World News',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                      Container(
                        width: 100,
                        child: Tab(
                            child: Text(
                          'My News',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                      Container(
                        width: 100,
                        child: Tab(
                            child: Text(
                          'Popular',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ]),
              ),

// // ********************* bottomNavigationBar***********************

              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,

              bottomNavigationBar: BottomAppBar(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Text(
                        "Powered By @MARIA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.red.shade900,
              ),

// // *********************DRAWER****************************
              drawer: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.black,
                  ),
                  child: Drawer(
                    child: ListView(
                      children: <Widget>[
                        new UserAccountsDrawerHeader(
                            accountName: Text(""),
                            accountEmail: new Text("${currentUser!.email}"),
                            currentAccountPicture: new CircleAvatar(
                              backgroundColor: Colors.black,
                            )),
                        new ListTile(
                            title: Text(
                              "Top News",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new TopStories()));
                            }),
                        new ListTile(
                            title: Text("world News",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      WorldNews()));
                            }),
                        new ListTile(
                            title: Text("POPULAR  News",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PopularScreen()));
                            }),
                      ],
                    ),
                  )),
              body: TabBarView(
                children: [
                  TopStories(),
                  WorldNews(),
                  MyNewsScreen(),
                  PopularScreen(),
                ],
              ),
            )));
  }
}

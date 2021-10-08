// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:html';
import 'package:flutter/material.dart';
import 'package:test/Multicreen.dart/WorldNews.dart';
import 'package:test/loginScreen.dart';
import 'Multicreen.dart/MyNews.dart';
import 'Multicreen.dart/Popular.dart';
import 'Multicreen.dart/TopStories.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void _navigateToNextScreen(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => DrawerScreen()));
  // }

  @override
  Widget build(BuildContext context) {
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
                // automaticallyImplyLeading: false,

                // leading: Container(

                //     child: Drawer(
                //   child: ListView(
                //     children: [
                //       DrawerHeader(
                //         child: Text('Drawer Header'),
                //         decoration: BoxDecoration(
                //           color: Colors.blue,
                //         ),
                //       ),
                //       ListTile(
                //         title: Text('Item 1'),
                //         onTap: () {
                //           // Update the state of the app
                //           // ...
                //           // Then close the drawer
                //           Navigator.pop(context);
                //         },
                //       )
                //     ],
                //   ),
                // )

                // child: IconButton(
                //   onPressed: () => {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (BuildContext context) =>
                //                 DrawerScreen()))
                //   },
                //   icon: new Icon(Icons.menu),
                // ),
                // ),
                // leading: GestureDetector(
                //   onTap: () {
                //     // Navigator.pop(
                //     //   context,
                //     //   MaterialPageRoute(
                //     //     builder: (context) => Drawer(),
                //     //   ),
                //     // );
                //   },
                //   child: Icon(
                //     Icons.menu,
                //   ),
                // ),
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
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreen()));
                          },
                          icon: new Icon(Icons.person_rounded)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: PopupMenuButton(
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text("Settungs"),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text("Help"),
                                value: 2,
                              ),
                              PopupMenuItem(
                                child: Text("Contact Us"),
                                value: 3,
                              ),
                              PopupMenuItem(
                                child: Text("Other BBC apps"),
                                value: 4,
                              ),
                            ]),
                  )
                ],
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
              drawer: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.black,
                ),
                child: Drawer(
                    child: ListView(
                        padding: EdgeInsets.only(top: 3),
                        children: <Widget>[
                      ListTile(
                        title: Text('Top News',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('World News',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('My News',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Popular News',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onTap: () {},
                      ),
                    ])),
              ),
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

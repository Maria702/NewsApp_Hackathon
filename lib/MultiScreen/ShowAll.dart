// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test/AuthenScreen/loginScreen.dart';

class ShowAllNews extends StatefulWidget {
  var val;
  ShowAllNews(this.val);
  @override
  _ShowAllNewsState createState() => _ShowAllNewsState(val);
}

class _ShowAllNewsState extends State<ShowAllNews> {
  var Date;
  var val;
  _ShowAllNewsState(this.val);

  String _title(dynamic source) {
    return source['title'].toString();
  }

  String _author(dynamic source) {
    return source['author'].toString();
  }

  String _description(dynamic source) {
    return source['description'].toString();
  }

  String _time(dynamic source) {
    return source['publishedAt'].toString();
  }

  String _url(dynamic source) {
    return source['url'].toString();
  }

  String _content(dynamic source) {
    return source['content'].toString();
  }

  String _name(dynamic source) {
    return source["source"]['name'].toString();
  }

  @override
  void initState() {
    super.initState();

    print(val['author']);
    print(val['description']);
    print(val['url']);
    print(val['publishedAt']);
    print(val["source"]['name']);
    print(val['title']);
  }

  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(val['title']),
          backgroundColor: Colors.red.shade900,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(children: [
                Container(
                  width: vwidth / 1,
                  height: vwidth / 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${val['urlToImage']}"),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 5, right: 5, bottom: 5),
                  child: Center(
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Text(
                        "Author Name :",
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                      Expanded(
                          child: Text(
                        val['author'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 5, right: 5, bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "Descripton  :",
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                        Expanded(
                            child: Text(
                          val['description'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 5, right: 5, bottom: 5),
                  child: Center(
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Text(
                        "URL :",
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                      Expanded(
                          child: Text(
                        val['url'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 5, right: 5, bottom: 5),
                  child: Center(
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Text(
                        "Publish At :",
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                      Expanded(
                          child: Text(
                        val['publishedAt'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 5, right: 5, bottom: 5),
                  child: Center(
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Text(
                        "Source Name :",
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                      Expanded(
                          child: Text(
                        val["source"]['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                    ]),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}

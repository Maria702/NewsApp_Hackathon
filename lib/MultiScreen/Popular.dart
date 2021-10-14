// ignore_for_file: file_names, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:test/MultiScreen/ShowAll.dart';
import 'dart:convert';

class PopularScreen extends StatefulWidget {
  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  var Date;
  var val;

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

  String _id(dynamic source) {
    return source["source"]['id'].toString();
  }

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    var dt = DateTime.now();
    var newFormat = DateFormat("yy-MM-dd");
    String updatedDt = newFormat.format(dt);
    final String apiUrl =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=17b872e790924034941aece7d1ab8f6a';

    Future<List<dynamic>> fetchUsers() async {
      var result = await http.get(Uri.parse(apiUrl));

      return json.decode(result.body)["articles"];
    }

    print(updatedDt);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Popular News"),
        ),
        body: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(snapshot.data.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  ShowAllNews(val = snapshot.data[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            width: vwidth / 2.2,
                            height: vwidth / 4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${snapshot.data[index]['urlToImage']}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  _title(snapshot.data[index]),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

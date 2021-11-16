import 'package:LearnHub/api/LearnhubApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestAppState();
  }

  TestApp({Key key}) : super(key: key);
}

class Data {
  final int userId;
  final int id;
  final String title;

  Data({this.userId, this.id, this.title});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(userId: json['userId'], id: json['id'], title: json['title']);
  }
}

class _TestAppState extends State<TestApp> {
  Future<List<Data>> futureData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = LearnHubApi().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter API and ListView Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Listview')),
        body: Center(
          child: FutureBuilder<List<Data>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Data> data = snapshot.data;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 75,
                          color: Colors.white,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  constraints:
                                      BoxConstraints.tightFor(width: 70.0),
                                  child: Image.asset("assets/ic_learning.png",
                                      fit: BoxFit.fitWidth),
                                ),
                                Expanded(child: Text(data[index].title))
                              ],
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                //By default show a loading spinner
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}

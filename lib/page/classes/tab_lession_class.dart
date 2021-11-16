import 'package:LearnHub/api/LearnhubApi.dart';
import 'package:LearnHub/page/classes/classes_detail.dart';
import 'package:LearnHub/utils/Utils.dart';
import 'package:flutter/material.dart';

import '../test.dart';

class TabLessionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabLessionState();
  }
}

class TabLessionState extends State<TabLessionPage> {
  Future<List<Data>> futureData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = LearnHubApi().fetchData();
  }

  //bài giảng
  Widget listLessionWidget() {
    return FutureBuilder<List<Data>>(
        future: futureData,
        builder: (BuildContext context, AsyncSnapshot projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == null) {
            return GestureDetector(
              child: Center(
                child: Image.network(
                    "https://dzbbmecpa0hd2.cloudfront.net/video/avatar/2019/04/11/14/1554966002_de58c8a6be7d1046.jpg",
                    height: 120,
                    width: 120),
              ),
            );
          }
          return Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            color: HexColor.fromHex('#FFFFFF'),
            elevation: 2,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(maxWidth: 355),
                  margin: const EdgeInsets.only(top: 15.0, left: 10.0),
                  child: Text(
                    'Bài 1 : Sắp xếp thời gian làm việc khoa học',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.00),
                  ),
                ),
                SizedBox(height: 10), 
                Image(image: AssetImage('assets/ic_line_big.png')),
                Center(
                  child: FutureBuilder<List<Data>>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: ClampingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                Data data = snapshot.data[index];
                                return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                      vertical: 5.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(width: 13.0, height: 10.0),
                                        GestureDetector(
                                          onTap: () {
                                            // Navigator.of(context)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   return ClassesDetailPage(classesModel: project);
                                            // }));
                                          },
                                          child: Center(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/ic_classes_detail.png'),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // Navigator.of(context)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   return ClassesDetailPage(classesModel: project);
                                            // }));
                                          },
                                          onLongPress: () {
                                            // Navigator.of(context)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   return ClassesDetailPage(classesModel: project);
                                            // }));
                                          },
                                          child: Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 195),
                                            margin: const EdgeInsets.only(
                                                top: 2.0, left: 20.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Wrap(
                                                  alignment: WrapAlignment.end,
                                                  children: <Widget>[
                                                    Text(
                                                        'Bồi dưỡng kỹ năng chăm sóc khách hàng',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                                SizedBox(height: 10.0),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      child: new Image(
                                                        image: AssetImage(
                                                            'assets/ic_time.png'),
                                                        height: 18.0,
                                                        width: 25.0,
                                                      ),
                                                    ),
                                                    Text('1h25',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ],
                                                ),
                                                SizedBox(height: 25.0),
                                                Image(
                                                    image: AssetImage(
                                                        'assets/ic_line.png')),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ));
                              });
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        //By default show a loading spinner
                        return Container(
                          height: 10,
                          width: 10,
                          margin: EdgeInsets.all(5),
                          child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                HexColor.fromHex('#FAA244')),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        });
  }



  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[listLessionWidget()],
        ),
      ),
    );
  }
}

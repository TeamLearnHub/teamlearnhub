import 'package:LearnHub/api/LearnhubApi.dart';
import 'package:LearnHub/page/mycource/my_cource_detail.dart';
import 'package:LearnHub/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../test.dart';

class MyCourcePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCourceState();
  }
}

class MyCourceState extends State<MyCourcePage> {
  Future<List<Data>> futureData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = LearnHubApi().fetchData();
  }

  Widget myCourceWidget() {
    return FutureBuilder<List<Data>>(
        builder: (BuildContext context, AsyncSnapshot projectSnap) {
      if (projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == null) {
        return GestureDetector(
          child: Center(
            child: Image.network(
              'https://dzbbmecpa0hd2.cloudfront.net/video/avatar/2019/04/11/14/1554966002_de58c8a6be7d1046.jpg',
              height: 120,
              width: 120,
            ),
          ),
        );
      }

      return Center(
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
                      return new GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return MyCourseDetailPage();
                          }));
                        },
                        child: Card(
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                          color: HexColor.fromHex('#FFFFFF'),
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:
                                            AssetImage('assets/logo_class.png'),
                                        backgroundColor: Colors.transparent,
                                      ),
                                      SizedBox(width: 20.0),
                                      Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 220),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                                'Khóa học giao tiếp thông minh nơi công sở',
                                                style: TextStyle(
                                                    color: HexColor.fromHex(
                                                        '#212121'),
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 6.0),
                                            Wrap(
                                              children: <Widget>[
                                                Text('Lớp K12  | ',
                                                    style: TextStyle(
                                                        color: HexColor.fromHex(
                                                            '#E8943A'),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                Text('Trạng thái : Active ',
                                                    style: TextStyle(
                                                        color: HexColor.fromHex(
                                                            '#E8943A'),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal))
                                              ],
                                            ),
                                            SizedBox(height: 6.0),
                                            LinearPercentIndicator(
                                              width: 200.0,
                                              lineHeight: 3.0,
                                              percent: 0.5,
                                              backgroundColor:
                                                  HexColor.fromHex('#e7e7e7'),
                                              progressColor:
                                                  HexColor.fromHex('#AA3234'),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15.0),
                                  Image(
                                      image:
                                          AssetImage('assets/ic_line_big.png')),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Giảng viên ',
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#111111'),
                                                  fontSize: 16.0,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          SizedBox(height: 8.0),
                                          Text('Nguyễn Huy Anh ',
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#111111'),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 13.0),
                                          Text('Ngày bắt đầu',
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#111111'),
                                                  fontSize: 16.0,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          SizedBox(height: 7.0),
                                          Text('09/10/2021',
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#111111'),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(width: 40.0),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Chứng chỉ ',
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#111111'),
                                                  fontSize: 16.0,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          SizedBox(height: 8.0),
                                          Text('Chưa có',
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#111111'),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 13.0),
                                          Text('Ngày kết thúc',
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#111111'),
                                                  fontSize: 16.0,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          SizedBox(height: 7.0),
                                          Text('03/10/2021',
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#111111'),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              //By default show a loading spinner
              return Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.all(5),
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      HexColor.fromHex('#FAA244')),
                ),
              );
            }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var ic_notification = new Image(
        image: AssetImage('assets/ic_notification.png'), height: 35, width: 50);
    // TODO: implement build
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: HexColor.fromHex('F5f6f9'),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  HexColor.fromHex('#FAA244'),
                  HexColor.fromHex('#FF8400')
                ]),
              ),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Khoá học của tôi',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    )
                  ],
                ),
                flexibleSpace: Image(
                  image: AssetImage('assets/ic_toolbar.png'),
                  fit: BoxFit.cover,
                ),
                actions: [
                  Stack(
                    children: [
                      IconButton(onPressed: () {}, icon: ic_notification),
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 10),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffc32c37),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Text(
                                  '5',
                                  style: TextStyle(fontSize: 10),
                                ),
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
        body: Container(
          child: SingleChildScrollView(child: myCourceWidget()),
        ),
      ),
    );
  }
}

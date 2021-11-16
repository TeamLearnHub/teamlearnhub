import 'package:LearnHub/api/LearnhubApi.dart';
import 'package:LearnHub/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../test.dart';
import 'classes_detail.dart';

class TabIntroductionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabIntroductionState();
  }
}

class _TabIntroductionState extends State<TabIntroductionPage> {
  Future<List<Data>> futureData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = LearnHubApi().fetchData();
  }
//các khoá học khác
  Widget allClassesWidget() {
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
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 18, right: 0),
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Các khoá học khác ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
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
                                    horizontal: 8.0,
                                    vertical: 5.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(width: 13.0, height: 13.0),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return ClassesDetailPage();
                                            }));
                                          },
                                          child: Center(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/ic_classes_detail.png'),
                                            ),
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ClassesDetailPage();
                                          }));
                                        },
                                        onLongPress: () {},
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              top: 0, left: 15.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(width: 6.0),
                                                  Text(
                                                      'Kỹ năng quản lý thời gian',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              SizedBox(height: 10.0),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    child: new Image(
                                                        image: AssetImage(
                                                            'assets/ic_students.png'),
                                                        height: 15,
                                                        width: 15),
                                                  ),
                                                  Text('30M | ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              HexColor.fromHex(
                                                                  '#787878'))),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 1.0),
                                                    child: new Image(
                                                        image: AssetImage(
                                                            'assets/ic_class.png'),
                                                        height: 15.0,
                                                        width: 15.0),
                                                  ),
                                                  Text('05 Lớp | ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              HexColor.fromHex(
                                                                  '#787878'))),
                                                  Container(
                                                    child: new Image(
                                                      image: AssetImage(
                                                          'assets/ic_time.png'),
                                                      height: 15.0,
                                                      width: 15.0,
                                                    ),
                                                  ),
                                                  Text('07 ngày',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                              SizedBox(height: 5.0),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 5.0,
                                                    top: 10.0,
                                                    bottom: 10.0,
                                                    right: 20.0),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: new Container(
                                                    height: 35,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.2,
                                                    decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            HexColor.fromHex(
                                                                '#FAA244'),
                                                            HexColor.fromHex(
                                                                '#FF8400')
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    50))),
                                                    child: Center(
                                                      child: Text(
                                                        'Đăng ký'.toUpperCase(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
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
              ),
            ],
          );
        });
  }
  Widget introductionWidget() {
    return Card(
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        color: HexColor.fromHex('#FFFFFF'),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: Text('Bạn sẽ nhận được gì từ khoá học',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Container(
                    constraints: BoxConstraints(maxWidth: 275),
                    child: Text('Sắp xếp thời gian làm việc khoa học',
                        style: TextStyle(color: Colors.black, fontSize: 16.5)),
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Container(
                    constraints: BoxConstraints(maxWidth: 275),
                    child: Text('Quản lý thời gian làm việc của bản thân',
                        maxLines: 2,
                        style: TextStyle(color: Colors.black, fontSize: 16.5)),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Container(
                    constraints: BoxConstraints(maxWidth: 275),
                    child: Text('Sắp xếp thời gian làm việc cho nhân sự',
                        maxLines: 2,
                        style: TextStyle(color: Colors.black, fontSize: 16.5)),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Container(
                    constraints: BoxConstraints(maxWidth: 275),
                    child: Text('quản lý thời gian làm việc của bản thân',
                        maxLines: 2,
                        style: TextStyle(color: Colors.black, fontSize: 16.5)),
                  )
                ],
              ),
              SizedBox(height: 15.0),
              Container(
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                child: Image(image: AssetImage('assets/ic_line_big.png')),
              ),
              SizedBox(height: 15.0),
              Container(
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: Text('Bạn cần làm gì để đạt được mục tiêu ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Container(
                    constraints: BoxConstraints(maxWidth: 275),
                    child: Text('Thực hiện theo đúng lộ trình học tập',
                        maxLines: 2,
                        style: TextStyle(color: Colors.black, fontSize: 16.5)),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Container(
                    constraints: BoxConstraints(maxWidth: 275),
                    child: Text('Hoàn thành đầy đủ các bài kiểm tra',
                        maxLines: 2,
                        style: TextStyle(color: Colors.black, fontSize: 16.5)),
                  )
                ],
              ),
              SizedBox(height: 30.0)
            ],
          ),
        ));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              introductionWidget(),
              SizedBox(height: 15.0),
              Container(
                margin: const EdgeInsets.only(left: 25.0, right: 10.0),
                child: Image(image: AssetImage('assets/ic_line_big.png')),
              ),
              SizedBox(height: 15.0),
              allClassesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

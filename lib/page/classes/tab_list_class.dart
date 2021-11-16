import 'package:LearnHub/api/LearnhubApi.dart';
import 'package:LearnHub/page/mycource/my_cource_detail.dart';
import 'package:LearnHub/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../test.dart';
import 'classes_detail.dart';

class TabListClassPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabListClassState();
  }
}

class TabListClassState extends State<TabListClassPage> {
  void showDialogConfirm(BuildContext context) {
    Dialog confirmDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Xin chào!',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Text(
                        'Bạn có chắc chắn muốn đăng ký khoá học này ? ',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Chắc chắn',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Huỷ',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => confirmDialog);
  }

  Future<List<Data>> futureData;

  var listClasses = [
    'Tất cả khoá học',
    'Kỹ năng quản lý',
    'Kỹ năng mềm',
    'Khoá học Offline',
    'Quy trình nghiệp vụ',
  ];

  var currentListClasses = 'Tất cả khoá học';

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

  //danh sách lớp học
  Widget listClassWidget() {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage: AssetImage(
                                              'assets/logo_class.png'),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        SizedBox(width: 20.0),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 6.0),
                                            Row(
                                              children: <Widget>[
                                                Text('Lớp 05  | ',
                                                    style: TextStyle(
                                                        color:
                                                            HexColor.fromHex('#212121'),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                Text('Mã lớp : 005 ',
                                                    style: TextStyle(
                                                        color:
                                                            HexColor.fromHex('#212121'),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal))
                                              ],
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                                'đang chờ duyệt '.toUpperCase(),
                                                style: TextStyle(
                                                    color: HexColor.fromHex('#E8943A'),
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 15.0),
                                    Image(
                                        image: AssetImage(
                                            'assets/ic_line_big.png')),
                                    SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('Loại hình ',
                                                style: TextStyle(
                                                    color: HexColor.fromHex('#111111'),
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                            SizedBox(height: 8.0),
                                            Text('Online ',
                                                style: TextStyle(
                                                    color: HexColor.fromHex('#111111'),
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 13.0),
                                            Text('Số lượng',
                                                style: TextStyle(
                                                    color: HexColor.fromHex('#111111'),
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                            SizedBox(height: 7.0),
                                            Text('12/30',
                                                style: TextStyle(
                                                    color: HexColor.fromHex('#111111'),
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        SizedBox(width: 40.0),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('Giáo viên ',
                                                style: TextStyle(
                                                    color: HexColor.fromHex('#111111'),
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                            SizedBox(height: 8.0),
                                            Text('Lê Bảo Châu ',
                                                style: TextStyle(
                                                    color: HexColor.fromHex('#111111'),
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 13.0),
                                            Text('Thời gian ',
                                                style: TextStyle(
                                                    color: HexColor.fromHex('#111111'),
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                            SizedBox(height: 7.0),
                                            Container(
                                              constraints:
                                                  BoxConstraints(maxWidth: 155),
                                              child: Text(
                                                  '01/03/2020 - 20/03/2020',
                                                  style: TextStyle(
                                                      color:
                                                          HexColor.fromHex('#111111'),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )),
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
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = LearnHubApi().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    SystemChrome.setEnabledSystemUIOverlays([]);
    var ic_dropdow = new Image(
        image: AssetImage('assets/ic_dropdow.png'), height: 35, width: 50);
    // TODO: implement build
    return Scaffold(
        backgroundColor: HexColor.fromHex('f5f6f9'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  height: MediaQuery.of(context).size.height / 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: HexColor.fromHex('#FFFFFF')),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          icon: ic_dropdow,
                          value: currentListClasses,
                          isExpanded: true,
                          hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Tất cả khoá học')),
                          items: listClasses.map((String value) {
                            return new DropdownMenuItem<String>(
                                child: new Text(value), value: value);
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              this.currentListClasses = value;
//                            testSelect(value);
                              print(value);
                            });
                          }))),
              listClassWidget(),
              SizedBox(height: 15.0),
              Container(
                margin: const EdgeInsets.only(left: 35.0, right: 10.0),
                child: Image(image: AssetImage('assets/ic_line_big.png')),
              ),
              SizedBox(height: 15.0),
              allClassesWidget()
            ],
          ),
        ));
  }
}

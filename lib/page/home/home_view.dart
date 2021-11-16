import 'dart:convert';
import 'dart:ffi';
import 'package:LearnHub/api/LearnhubApi.dart';
import 'package:LearnHub/model/ClassesModel.dart';
import 'package:LearnHub/model/CourseCategoryResponse.dart';

import 'package:LearnHub/model/CourseResponse.dart';

import 'package:LearnHub/page/Ketquahoctap/Ketquahoctap.dart';
import 'package:LearnHub/page/classes/classes_detail.dart';
import 'package:LearnHub/page/exam/exam.dart';
import 'package:LearnHub/page/hoptructuyen/Hoptructuyen.dart';
import 'package:LearnHub/page/lotrinhhoctap/Lotrinhhoctap.dart';
import 'package:LearnHub/page/mycource/my_cource_detail.dart';
import 'package:LearnHub/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../test.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String accessToken;

  _loadToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      accessToken = (sharedPreferences.getString(Utils.key_token) ?? "");
    });
    print("accessToken = " + accessToken);
  }

  var listClasses = [
    'Tất cả các khoá học',
    'khoá học của tôi',
    'lộ trình học tập',
    'đề thi',
    'lịch học sắp tới',
    'kết quả học tập',
    'họp trực tuyến'
  ];
  List<ClassesModelResponse> listClassResponse = List<ClassesModelResponse>();

  Future<List<ClassesModelResponse>> fetchClasses() async {
    final http.Response response =
        await http.get("https://api.androidhive.info/json/menu.json", headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      Map result = json.decode(response.body);
    }
    return listClassResponse;
  }

  Future<List<Data>> futureData;
  Future<List<CourseCategory>> futureCourseCategory;
  Future<List<CourseListModel>> futureCourse;
  CourseBody courseBody;
  String urlCategory = "http://118.70.236.144:84/api/v1.0/coursecategory";
  String urlCourse = "http://118.70.236.144:84/api/v1.0/course/search";

  Future<List<CourseCategory>> getCategoryCourse() async {
    CourseCategoryResponse courseCategoryResponse;
    List<CourseCategory> list = new List<CourseCategory>();
    final http.Response response = await http.get(urlCategory, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    });
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print("statusCode = " + response.statusCode.toString());
      print((json.decode(response.body)).toString());

      courseCategoryResponse = CourseCategoryResponse.fromJson(result);
      list = courseCategoryResponse.result;
    }
    return list;
  }

  Future<List<CourseListModel>> getListCourse(CourseBody courseBody) async {
    CourseResponse courseResponse;
    List<CourseListModel> list = new List<CourseListModel>();
    final http.Response response = await http.post(urlCourse,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode(courseBody.toDatabaseJson()));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print("statusCode = " + response.statusCode.toString());
      print("getListCourse" + (json.decode(response.body)).toString());

      courseResponse = CourseResponse.fromJson(result);

      print(" getListCourse = " + courseResponse.result[0].avatarUrl);
      list = courseResponse.result;
    }
    return list;
  }

  //tất cả các khoá học
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
                padding: EdgeInsets.only(top: 16.0, left: 0, right: 0),
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Tất cả các khoá học',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      SizedBox(width: 60.0),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Xem thêm'.toUpperCase(),
                          style: TextStyle(
                              color: HexColor.fromHex('#AA3234'),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.00),
                        ),
                      )
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

  //khoá học
  Widget listCourseWidget() {
    return FutureBuilder<List<CourseListModel>>(
        future: futureCourse,
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
                Center(
                  child: FutureBuilder<List<CourseListModel>>(
                      future: futureCourse,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: ClampingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                CourseListModel data = snapshot.data[index];
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
                                                    Text(data.name,
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
                                                Text('30/10/2021',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                SizedBox(height: 10.0),
                                                Text('300 đã tham gia',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                SizedBox(height: 10.0),
                                                Text(
                                                    'Số lượng học viên tham gia : 30/50',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                SizedBox(height: 10.0),
                                                Text(
                                                    data.price.toString() +
                                                        " VNĐ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                SizedBox(height: 10.0),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                        return MyCourseDetailPage(
                                                            id: data.sId);
                                                      }));
                                                    });
                                                  },
                                                  child: new Container(
                                                    height: 50,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
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
                                                                    5))),
                                                    child: Center(
                                                      child: Text(
                                                        'Vào học'.toUpperCase(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10.0)
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

  //khoá học của tôi
  Widget myCourseWidget() {
    return FutureBuilder<List<CourseCategory>>(
        future: futureCourseCategory,
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
                padding: EdgeInsets.only(top: 16.0, left: 12, right: 0),
                child: Align(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Tìm kiếm chủ đề',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    SizedBox(width: 80.0),
                  ],
                )),
              ),
              Container(
                height: 290.0,
                width: double.maxFinite,
                margin: EdgeInsets.all(5.0),
                child: FutureBuilder<List<CourseCategory>>(
                    future: futureCourseCategory,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: ClampingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              CourseCategory data = snapshot.data[index];
                              return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.0,
                                    vertical: 8.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(width: 8.0),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.of(context)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   return MyCourseDetailPage(classesModel: project);
                                          // }));
                                        },
                                        onLongPress: () {
                                          // Navigator.of(context)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   return MyCourseDetailPage(classesModel: project);
                                          // }));
                                        },
                                        child: Container(
                                            height: 260.0,
                                            margin: const EdgeInsets.only(
                                                top: 15.0),
                                            child: Stack(
                                              children: <Widget>[
                                                Image(
                                                    image: NetworkImage(
                                                        data.avatarUrl)),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(height: 180.0),
                                                    Row(
                                                      children: <Widget>[
                                                        SizedBox(width: 8.0),
                                                        Text(
                                                            'Kỹ năng quản lý thời gian',
                                                            style: TextStyle(
                                                                color: HexColor
                                                                    .fromHex(
                                                                        '#FFFFFF'),
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal))
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.0),
                                                    Wrap(
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Container(
                                                          child: new Image(
                                                              image: AssetImage(
                                                                  'assets/ic_students.png'),
                                                              color: HexColor
                                                                  .fromHex(
                                                                      '#FFFFFF'),
                                                              height: 18,
                                                              width: 25),
                                                        ),
                                                        Text('30 | ',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: HexColor
                                                                    .fromHex(
                                                                        '#FFFFFF'))),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 1.0),
                                                          child: new Image(
                                                              image: AssetImage(
                                                                  'assets/ic_class.png'),
                                                              color: HexColor
                                                                  .fromHex(
                                                                      '#FFFFFF'),
                                                              height: 18.0,
                                                              width: 25.0),
                                                        ),
                                                        Text('05 Lớp | ',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: HexColor
                                                                    .fromHex(
                                                                        '#FFFFFF'))),
                                                        Container(
                                                          child: new Image(
                                                            image: AssetImage(
                                                                'assets/ic_time.png'),
                                                            color: HexColor
                                                                .fromHex(
                                                                    '#FFFFFF'),
                                                            height: 18.0,
                                                            width: 25.0,
                                                          ),
                                                        ),
                                                        Text('7d 18h',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: HexColor
                                                                    .fromHex(
                                                                        '#FFFFFF'))),
                                                      ],
                                                    ),
                                                    SizedBox(height: 15.0),
                                                    LinearPercentIndicator(
                                                      width: 200.0,
                                                      lineHeight: 2.0,
                                                      percent: 0.75,
                                                      backgroundColor:
                                                          HexColor.fromHex(
                                                              '#FFFFFF'),
                                                      progressColor:
                                                          HexColor.fromHex(
                                                              '#E8943A'),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )),
                                      )
                                    ],
                                  ));
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      //By default show a loading spinner
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 0,
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

  //lịch học sắp tới
  Widget scheduleWidget() {
    return FutureBuilder<List<Data>>(
        future: futureData,
        builder: (BuildContext context, AsyncSnapshot projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == null) {
            return GestureDetector(
              child: Image.network(
                "https://dzbbmecpa0hd2.cloudfront.net/video/avatar/2019/04/11/14/1554966002_de58c8a6be7d1046.jpg",
                height: 120,
                width: 120,
              ),
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Lịch học sắp tới',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.00),
                      ),
                      SizedBox(
                        width: 95.0,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Xem thêm',
                          style: TextStyle(
                              color: HexColor.fromHex('#AA3234'),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.00),
                        ),
                      )
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
                                    horizontal: 5.0,
                                    vertical: 5.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
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
                                                  Text('15/06/2020',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
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
          );
        });
  }

  // lộ trình học tập
  Widget learningWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lotrinhhoctap()));
      },
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Image(
            image: AssetImage("assets/logo_learning.png"),
            height: 225.0,
            width: double.maxFinite,
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Text(
              'Lộ trình học tập',
              style: TextStyle(
                  color: HexColor.fromHex("#FFFFFF"),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }

  //đề thi
  Widget ExamingWidget() {
    return Container(
        margin: const EdgeInsets.all(1.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dethi()));
          },
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(image: AssetImage('assets/logo_exam.png')),
                  Text(
                    'Đề thi',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: HexColor.fromHex('#434343'),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200.0,
                  ),
                  Image(image: AssetImage('assets/ic_next.png'))
                ],
              )),
        ));
  }

  //kết quả học tập
  Widget Result() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Ketquahoctap()));
        },
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: AssetImage('assets/logo_result.png')),
                SizedBox(width: 20.0),
                Text(
                  'Kết quả học tập',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: HexColor.fromHex('#434343'),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 160.0,
                ),
                Image(image: AssetImage('assets/ic_next.png'))
              ],
            )),
      ),
    );
  }

  //họp trực tuyến
  Widget meetingWidget() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Hoptructuyen()));
        },
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: AssetImage('assets/logo_meeting.png')),
                SizedBox(width: 16.0),
                Text(
                  'Họp trực tuyến',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: HexColor.fromHex('#434343'),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 160.0,
                ),
                Image(image: AssetImage('assets/ic_next.png'))
              ],
            )),
      ),
    );
  }

  Future<Void> readJson() async {
    final String response = await rootBundle.loadString('assets/schedule.json');
    final data = await json.decode(response);
    print("data = " + data.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    courseBody = new CourseBody("1", "20");
    _loadToken();
    fetchClasses();
    futureData = LearnHubApi().fetchData();
    futureCourseCategory = getCategoryCourse();
    futureCourse = getListCourse(courseBody);
  }

  @override
  Widget build(BuildContext context) {
    var ic_more = new Image(
        image: AssetImage('assets/ic_more.png'), height: 35, width: 50);

    var ic_notification = new Image(
        image: AssetImage('assets/ic_notification.png'), height: 35, width: 50);
    var ic_search = new Image(image: AssetImage('assets/ic_search.png'));

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [HexColor.fromHex('#FAA244'), HexColor.fromHex('#FF8400')],
          )),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Chào mừng đến',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                const Text(
                  'LearnHub',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                )
              ],
            ),
            flexibleSpace: Image(
              image: AssetImage('assets/ic_toolbar.png'),
              fit: BoxFit.fitWidth,
            ),
            actions: [
              Stack(
                children: [
                  IconButton(icon: ic_notification, onPressed: () {}),
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
                            border: Border.all(color: Colors.white, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Center(
                            child: Text(
                              '5',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              PopupMenuButton<String>(
                icon: ic_more,
                itemBuilder: (BuildContext context) {
                  return listClasses?.map((String choice) {
                    return PopupMenuItem<String>(
                      child: Text(choice),
                      value: choice,
                    );
                  }).toList();
                },
                onSelected: null,
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50,
                margin: EdgeInsets.only(top: 20),
                padding:
                    EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: HexColor.fromHex('#F5F6F9'),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ]),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tìm khoá học',
                        icon: ic_search)),
              ),
              SizedBox(height: 10),
              Visibility(child: myCourseWidget(), visible: true),
              SizedBox(height: 10),
              Visibility(child: listCourseWidget(), visible: true),
              SizedBox(height: 15.0)
            ],
          ),
        ),
      ),
    );
  }
}

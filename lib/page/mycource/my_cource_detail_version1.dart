import 'dart:convert';
import 'package:LearnHub/model/CourseClassResponse.dart';
import 'package:LearnHub/model/CourseDetailResponse.dart';
import 'package:LearnHub/utils/Utils.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

import 'my_learning.dart';

class MyCourseDetailVesion1Page extends StatefulWidget {
  final String id;

  MyCourseDetailVesion1Page({this.id});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCourceDetailVersion1State();
  }
}

class MyCourceDetailVersion1State extends State<MyCourseDetailVesion1Page> {
  String accessToken;
  String urlCourseDetail = "http://118.70.236.144:84/api/v1.0/course/";
  String urlCourseClass =
      "http://118.70.236.144:84/api/v1.0/course/class?courseId=";
  CourseDetailResponse courseResponse;
  CourseClassResponse courseClassResponse;
  Future<List<CourseDetailModel>> futureCourse;
  Future<List<CourseClassModel>> futureClass;

  _loadToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      accessToken = (sharedPreferences.getString(Utils.key_token) ?? "");
    });

    print("accessToken = " + accessToken);
  }

  Future<CourseDetailResponse> getCourseDetail() async {
    // List<CourseDetailModel> list = new List<CourseDetailModel>();
    final http.Response response =
        await http.get(urlCourseDetail + widget.id, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    });

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print("statusCode = " + response.statusCode.toString());
      print("getCourseDetail" + (json.decode(response.body)).toString());

      courseResponse = CourseDetailResponse.fromJson(result);
      print("getCourseDetail" + courseResponse.result.avatarUrl);
    }
    return courseResponse;
  }

  Future<List<CourseClassModel>> getCourseClass() async {
    List<CourseClassModel> list = new List<CourseClassModel>();
    final http.Response response =
        await http.get(urlCourseClass + widget.id, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    });

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print("statusCode = " + response.statusCode.toString());
      print("getCourseDetail" + (json.decode(response.body)).toString());

      courseClassResponse = CourseClassResponse.fromJson(result);
      list = courseClassResponse.result;
    }
    return list;
  }

  // lộ trình học tập
  Widget learningWidget() {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Lotrinhhoctap()));
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
              '',
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

  //khoá học
  Widget detailCourse() {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      color: HexColor.fromHex('#FFFFFF'),
      elevation: 2,
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      margin: const EdgeInsets.only(top: 2.0, left: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Giới thiệu',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              )),
                          SizedBox(height: 10),
                          Wrap(
                            alignment: WrapAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    // Navigator.of(context)
                                    //     .push(MaterialPageRoute(builder: (context) {
                                    //   return MyCourseDetailPage(id: data.sId);
                                    // }));
                                  });
                                },
                                child: new Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          HexColor.fromHex('#FAA244'),
                                          HexColor.fromHex('#FF8400')
                                        ],
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Center(
                                    child: Text(
                                      'Active'.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Text('Lớp : L001',
                              style: TextStyle(fontWeight: FontWeight.normal)),
                          SizedBox(height: 10.0),
                          Text('Ngày bắt đầu : 20/10/2021',
                              style: TextStyle(fontWeight: FontWeight.normal)),
                          SizedBox(height: 10.0),
                          Text('Ngày hết hạn 11 30',
                              style: TextStyle(fontWeight: FontWeight.normal)),
                          SizedBox(height: 10.0),
                          Text("Chứng chỉ : nội bộ",
                              style: TextStyle(fontWeight: FontWeight.normal)),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return MyLearningPage();
                                }));
                              });
                            },
                            child: new Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 3.5,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      HexColor.fromHex('#FAA244'),
                                      HexColor.fromHex('#FF8400')
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Center(
                                child: Text(
                                  'Vào học'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Text('Khóa học giao tiếp thông minh nơi công sở',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ))
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Text('Chứng chỉ : Nhận trực tiếp',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  //khoá học
  Widget listCourseClassWidget() {
    return FutureBuilder<List<CourseClassModel>>(
        future: futureClass,
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
                  child: FutureBuilder<List<CourseClassModel>>(
                      future: futureClass,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: ClampingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                CourseClassModel data = snapshot.data[index];
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
                                                    data.isApproved.toString() +
                                                        " VNĐ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                SizedBox(height: 10.0),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      // Navigator.of(context).push(
                                                      //     MaterialPageRoute(
                                                      //         builder:
                                                      //             (context) {
                                                      //   return MyCourseDetailPage(
                                                      //       id: data.sId);
                                                      // }));
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

  VideoPlayerController video;
  ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadToken();
    //initializePlayer();
    getCourseDetail();
    futureClass = getCourseClass();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //video.dispose();
    //_chewieController.dispose();
    super.dispose();
  }

// Future<Void> initializePlayer() async {
//   // video = VideoPlayerController.network(
//   //     'https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4');
//   video = VideoPlayerController.asset('assets/test.mp4');
//
//   await Future.wait([video.initialize()]);
//   _chewieController = ChewieController(
//       videoPlayerController: video,
//       autoPlay: true,
//       looping: true,
//       subtitle: Subtitles([
//         Subtitle(
//             index: 0,
//             start: Duration.zero,
//             end: const Duration(seconds: 10),
//             text: '')
//       ]),
//       subtitleBuilder: (context, subtitle) => Container(
//             padding: const EdgeInsets.all(10.0),
//             child: Text(
//               subtitle,
//               style: const TextStyle(color: Colors.white),
//             ),
//           ));
//
//   setState(() {});
// }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Khám phá",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Expanded(
              //   child: Center(
              //     child: _chewieController != null &&
              //             _chewieController
              //                 .videoPlayerController.value.isInitialized
              //         ? Chewie(
              //             controller: _chewieController,
              //           )
              //         : Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: const [
              //               CircularProgressIndicator(),
              //               SizedBox(height: 20),
              //               Text('Loading'),
              //             ],
              //           ),
              //   ),
              // ),
              SizedBox(height: 10.0),
              learningWidget(),
              detailCourse(),
              SizedBox(height: 50.0)
              // Container(
              //   margin: const EdgeInsets.only(top: 15.0, left: 27.0),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Row(
              //         children: <Widget>[
              //           SizedBox(width: 6.0),
              //           Text('Khóa học giao tiếp thông minh nơi công sở',
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 16.0,
              //                   fontWeight: FontWeight.bold))
              //         ],
              //       ),
              //       SizedBox(height: 10.0),
              //       Wrap(
              //         crossAxisAlignment: WrapCrossAlignment.center,
              //         children: <Widget>[
              //           Container(
              //             child: new Image(
              //                 image: AssetImage('assets/ic_students.png'),
              //                 height: 18,
              //                 width: 25),
              //           ),
              //           Text('30M | ',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.normal,
              //                   color: HexColor.fromHex('#787878'))),
              //           Container(
              //             margin: const EdgeInsets.only(bottom: 1.0),
              //             child: new Image(
              //                 image: AssetImage('assets/ic_class.png'),
              //                 height: 18.0,
              //                 width: 25.0),
              //           ),
              //           Text('05 Lớp | ',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.normal,
              //                   color: HexColor.fromHex('#787878'))),
              //           Container(
              //             child: new Image(
              //               image: AssetImage('assets/ic_time.png'),
              //               height: 18.0,
              //               width: 25.0,
              //             ),
              //           ),
              //           Text('07 ngày',
              //               style: TextStyle(fontWeight: FontWeight.normal)),
              //         ],
              //       ),
              //       SizedBox(height: 5.0),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 15.0),
              // Image(image: AssetImage('assets/ic_line_big.png')),
              // SizedBox(height: 15.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: <Widget>[
              //     SizedBox(width: 30),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         Text('Giảng viên ',
              //             style: TextStyle(
              //                 color: HexColor.fromHex('#111111'),
              //                 fontSize: 16.0,
              //                 fontWeight: FontWeight.normal)),
              //         SizedBox(height: 8.0),
              //         Text('Nguyễn Huy Anh ',
              //             style: TextStyle(
              //                 color: HexColor.fromHex('#111111'),
              //                 fontSize: 16.0,
              //                 fontWeight: FontWeight.bold)),
              //         SizedBox(height: 13.0),
              //         Text('Ngày bắt đầu',
              //             style: TextStyle(
              //                 color: HexColor.fromHex('#111111'),
              //                 fontSize: 16.0,
              //                 fontWeight: FontWeight.normal)),
              //         SizedBox(height: 7.0),
              //         Text('01/03/2020',
              //             style: TextStyle(
              //                 color: HexColor.fromHex('#111111'),
              //                 fontSize: 16.0,
              //                 fontWeight: FontWeight.bold)),
              //       ],
              //     ),
              //     SizedBox(width: 40.0),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         Text('Lớp',
              //             style: TextStyle(
              //                 color: HexColor.fromHex('#111111'),
              //                 fontSize: 16.0,
              //                 fontWeight: FontWeight.normal)),
              //         SizedBox(height: 8.0),
              //         Text('K12',
              //             style: TextStyle(
              //                 color: HexColor.fromHex('#111111'),
              //                 fontSize: 16.0,
              //                 fontWeight: FontWeight.bold)),
              //         SizedBox(height: 13.0),
              //         Text('Ngày kết thúc',
              //             style: TextStyle(
              //                 color: HexColor.fromHex('#111111'),
              //                 fontSize: 16.0,
              //                 fontWeight: FontWeight.normal)),
              //         SizedBox(height: 7.0),
              //         Text('03/03/2020',
              //             style: TextStyle(
              //                 color: HexColor.fromHex('#111111'),
              //                 fontSize: 16.0,
              //                 fontWeight: FontWeight.bold)),
              //       ],
              //     )
              //   ],
              // ),
              // SizedBox(height: 210.0),
              // listCourseClassWidget()
            ],
          ),
        ),
      ),
    );
  }
}

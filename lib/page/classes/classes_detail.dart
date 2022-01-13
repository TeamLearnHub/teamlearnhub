import 'dart:ffi';

import 'package:LearnHub/page/classes/tab_introduction_class.dart';
import 'package:LearnHub/page/classes/tab_lession_class.dart';
import 'package:LearnHub/page/classes/tab_list_class.dart';
import 'package:LearnHub/page/comment/comment_view.dart';
import 'package:LearnHub/page/mycource/tab_introduction_cource.dart';
import 'package:LearnHub/utils/Utils.dart';
import 'package:chewie/chewie.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../join_screen.dart';

class ClassesDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClassesDetailSate();
  }
}

class ClassesDetailSate extends State<ClassesDetailPage> {
  VideoPlayerController video;
  ChewieController _chewieController;

  final List<String> option = [
    'Danh sách lớp'.toUpperCase(),
    'GIỚI THIỆU'.toUpperCase(),
    'BÀI GIẢNG'.toUpperCase(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      // _indexSelected = index;
    });
  }

  final _pageoption = [
    TabListClassPage(),
    TabIntroductionPage(),
    TabLessionPage()
  ];

  Future<Void> initializePlayer() async {
    // video = VideoPlayerController.network(
    //     'https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4');
    video = VideoPlayerController.asset('assets/test.mp4');

    await Future.wait([video.initialize()]);
    _chewieController = ChewieController(
        videoPlayerController: video,
        autoPlay: true,
        looping: true,
        subtitle: Subtitles([
          Subtitle(
              index: 0,
              start: Duration.zero,
              end: const Duration(seconds: 10),
              text: '')
        ]),
        subtitleBuilder: (context, subtitle) => Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.white),
              ),
            ));

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    video.dispose();
    _chewieController.dispose();
    super.dispose();
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
                          Text('Online Learning',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              )),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text('Khóa học giao tiếp thông minh nơi công sở',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ))
                            ],
                          ),
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
                                  width: MediaQuery.of(context).size.width / 2,
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
                                      'Chưa hoàn thành'.toUpperCase(),
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
                          Text('Số lượng học viên tham gia : 10/20',
                              style: TextStyle(fontWeight: FontWeight.normal)),
                          SizedBox(height: 10.0),
                          Text('Ngày bắt đầu : 20/10/2021',
                              style: TextStyle(fontWeight: FontWeight.normal)),
                          SizedBox(height: 10.0),
                          Text('Ngày kết thúc : 30/10/2021',
                              style: TextStyle(fontWeight: FontWeight.normal)),
                          SizedBox(height: 10.0),
                          Text("Danh mục : Tiếng Anh",
                              style: TextStyle(fontWeight: FontWeight.normal)),
                          SizedBox(height: 10),
                          Text('Tiếng anh Toeic cơ bản',
                              maxLines: 4,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,

                              )
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

  Widget titleClassesDetail() {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
                image: AssetImage('assets/ic_classes_detail.png'), height: 100),
//            GestureDetector(
//              onTap: () {
//                Navigator.of(context)
//                    .push(MaterialPageRoute(builder: (context) {
//                  return ClassesDetailPage(classesModel: project);
//                }));
//              },
//              child: Center(
//                child: Image.network(project?.avatar,
//                    height: 130, width: 130),
//              ),
//            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ClassesDetailPage();
                }));
              },
              onLongPress: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ClassesDetailPage();
                }));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Kỹ năng quản lý thời gian',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Container(
                          child: new Image(
                              image: AssetImage('assets/ic_students.png'),
                              height: 18,
                              width: 25),
                        ),
                        Text('30M | ',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: HexColor.fromHex('#787878'))),
                        Container(
                          margin: const EdgeInsets.only(bottom: 1.0),
                          child: new Image(
                              image: AssetImage('assets/ic_class.png'),
                              height: 18.0,
                              width: 25.0),
                        ),
                        Text('05 Lớp | ',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: HexColor.fromHex('#787878'))),
                        Container(
                          child: new Image(
                            image: AssetImage('assets/ic_time.png'),
                            height: 18.0,
                            width: 25.0,
                          ),
                        ),
                        Text('07d 18h',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: HexColor.fromHex('#787878'))),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 5.0, top: 10.0, bottom: 10.0, right: 20.0),
                      child: InkWell(
                        onTap: () {
                          showDialogConfirm(context);
                        },
                        child: new Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width / 3.2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  HexColor.fromHex('#FAA244'),
                                  HexColor.fromHex('#FF8400')
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Center(
                            child: Text(
                              'Đăng ký'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  void showDialogConfirm(BuildContext context) {
    Dialog confirmDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Center(
                  child: Text(
                    'Cảm ơn bạn đã đăng ký khoá học này. Hãy chờ thông tin kiểm duyệt từ ban quản lý!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: HexColor.fromHex('#212121'), fontSize: 16.0),
                  ),
                )),
            SizedBox(height: 15.0),
            Image(image: AssetImage('assets/ic_¬line_big.png')),
            SizedBox(height: 15.0),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Đồng ý'.toUpperCase(),
                style: TextStyle(
                    fontSize: 18.0,
                    color: HexColor.fromHex('#AA3234'),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => confirmDialog);
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
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
          "Chi tiết lớp học",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Stack(
                //   alignment: Alignment.topRight,
                //   children: [
                //     Container(
                //       height: 300.0,
                //       width: double.infinity,
                //       child: Center(
                //         child: _chewieController != null &&
                //                 _chewieController
                //                     .videoPlayerController.value.isInitialized
                //             ? Chewie(
                //                 controller: _chewieController,
                //               )
                //             : Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: const [
                //                   CircularProgressIndicator(),
                //                   Text('Loading'),
                //                 ],
                //               ),
                //       ),
                //     ),
                //   ],
                // ),
                learningWidget(),
                detailCourse(),
                ExpandablePanel(
                    header: Text('Lịch học', style: TextStyle(fontSize: 16.0)),
                    collapsed: Container(
                        margin: const EdgeInsets.only(
                            left: 5.0, top: 10.0, bottom: 10.0, right: 20.0),
                        child:
                            Text('Lịch học', style: TextStyle(fontSize: 16.0))),
                    expanded: Text(
                      '',
                      softWrap: true,
                    )),
                SizedBox(height: 10.0),
                ExpandablePanel(
                    header: Text('Họp trực tuyến',
                        style: TextStyle(fontSize: 16.0)),
                    collapsed: Container(
                      margin: const EdgeInsets.only(
                          left: 5.0, top: 10.0, bottom: 10.0, right: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return JoinWidget();
                          }));
                        },
                        child: new Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 3.2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  HexColor.fromHex('#FAA244'),
                                  HexColor.fromHex('#FF8400')
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
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
                    ),
                    expanded: Text(
                      '',
                      softWrap: true,
                    )),
                SizedBox(height: 10.0),
                ExpandablePanel(
                    header: Text('Thi', style: TextStyle(fontSize: 16.0)),
                    collapsed: Container(
                        margin: const EdgeInsets.only(
                            left: 5.0, top: 0, bottom: 10.0, right: 20.0),
                        child: Text('Thi', style: TextStyle(fontSize: 16.0))),
                    expanded: Text(
                      '',
                      softWrap: true,
                    )),
                ExpandablePanel(
                    header: Text('Danh sách giáo viên',
                        style: TextStyle(fontSize: 16.0)),
                    collapsed: Container(
                        margin: const EdgeInsets.only(
                            left: 5.0, top: 10.0, bottom: 10.0, right: 20.0),
                        child: Text('Danh sách giáo viên',
                            style: TextStyle(fontSize: 16.0))),
                    expanded: Text(
                      '',
                      softWrap: true,
                    )),
                ExpandablePanel(
                    header: Text('Tài liệu', style: TextStyle(fontSize: 16.0)),
                    collapsed: Container(
                        margin: const EdgeInsets.only(
                            left: 5.0, top: 10.0, bottom: 10.0, right: 20.0),
                        child:
                            Text('Tài liệu', style: TextStyle(fontSize: 16.0))),
                    expanded: Text(
                      '',
                      softWrap: true,
                    )),
                ExpandablePanel(
                    header: Text('Chứng chỉ', style: TextStyle(fontSize: 16.0)),
                    collapsed: Container(
                        margin: const EdgeInsets.only(
                            left: 5.0, top: 10.0, bottom: 10.0, right: 20.0),
                        child: Text('Chứng chỉ',
                            style: TextStyle(fontSize: 16.0))),
                    expanded: Text(
                      '',
                      softWrap: true,
                    )),
                ExpandablePanel(
                    header: Text('Đánh giá và bình luận',
                        style: TextStyle(fontSize: 16.0)),
                    collapsed: Container(
                        margin: const EdgeInsets.only(
                            left: 5.0, top: 10.0, bottom: 10.0, right: 20.0),
                        child: Text('Đánh giá và bình luận',
                            style: TextStyle(fontSize: 16.0))),
                    expanded: Text(
                      '',
                      softWrap: true,
                    )),
              ],
            ),
          )),
    );
  }
}

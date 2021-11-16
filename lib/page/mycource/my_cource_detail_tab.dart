import 'dart:ffi';
import 'package:LearnHub/page/comment/comment_view.dart';
import 'package:LearnHub/page/login/login_view.dart';
import 'package:LearnHub/page/mycource/tab_introduction_cource.dart';
import 'package:LearnHub/utils/Utils.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CourceDetailTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CourceDetailTabState();
  }
}

class CourceDetailTabState extends State<CourceDetailTabPage> {
  final List<String> option = [
    'giới thiệu'.toUpperCase(),
    'thảo luận'.toUpperCase(),
    'câu hỏi cho gv'.toUpperCase(),
  ];

  final _pageoption = [
    TabIntroductionCourcePage(),
    CommentPage(),
    CommentPage()
  ];

  int _indexSelected = 0;

  void _onItemTapped(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  VideoPlayerController video;
  ChewieController _chewieController;

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

  Widget titleClassesDetail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(left: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      SizedBox(width: 6.0),
                      Text('Kỹ năng quản lý thời gian',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal))
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
                ],
              ),
            ),
          )
        ],
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor.fromHex('f5f6f9'),
      body: Container(
        child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 300.0,
                      width: double.infinity,
                      child: Center(
                        child: _chewieController != null &&
                                _chewieController
                                    .videoPlayerController.value.isInitialized
                            ? Chewie(
                                controller: _chewieController,
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircularProgressIndicator(),
                                  Text('Loading'),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                titleClassesDetail(),
                SizedBox(height: 10.0),
                Container(
                  margin: const EdgeInsets.only(left: 25.0, right: 10.0),
                  child: Image(image: AssetImage('assets/ic_line_big.png')),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 40.0,
                  color: HexColor.fromHex('f5f6f9'),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: option.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            _onItemTapped(index);
                          },
                          child: Container(
                              child: Container(
                                  width: 142,
                                  color: index == _indexSelected
                                      ? HexColor.fromHex('f5f6f9')
                                      : HexColor.fromHex('f5f6f9'),
                                  height: 40.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        option[index],
                                        style: TextStyle(
                                            color: index == _indexSelected
                                                ? HexColor.fromHex('#AA3234')
                                                : HexColor.fromHex('#111111'),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ))),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 4),
                  height: 525,
                  child: _pageoption[_indexSelected],
                )
              ],
            )),
      ),
    );
  }
}

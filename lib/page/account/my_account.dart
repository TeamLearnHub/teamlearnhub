import 'package:LearnHub/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MyAccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAccountState();
  }
}

class MyAccountState extends State<MyAccountPage> {
  // lộ trình học tập
  Widget routeWidget() {
    return Container(
      margin: const EdgeInsets.only(top:8,bottom:8,left:16,right:16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            label: Utils.customText(text: "Lộ trình học tập"),
            icon: Image(image: AssetImage('assets/ic_learning.png')),
          ),
          Image(image: AssetImage('assets/ic_next.png'))
        ],
      ),
    );
  }

  //Đề thi
  Widget ExamingWidget() {
    return Container(
      margin: const EdgeInsets.only(top:8,bottom:8,left:16,right:16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            label: Utils.customText(text: "Đề thi"),
            icon: Image(image: AssetImage('assets/ic_exam.png')),
          ),
          Image(image: AssetImage('assets/ic_next.png'))
        ],
      ),
    );

  }

  //kết quả học tập
  Widget Result() {
    return Container(
      margin: const EdgeInsets.only(top:18,bottom:8,left:16,right:16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            label: Utils.customText(text: "Kết quả học tập"),
            icon: Image(image: AssetImage('assets/ic_result.png')),
          ),
          Image(image: AssetImage('assets/ic_next.png'))
        ],
      ),
    );

  }

  //họp trực tuyến
  Widget meetingWidget() {
    return Container(
      margin: const EdgeInsets.only(top:18,bottom:8,left:16,right:16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            label: Utils.customText(text: "Họp trực tuyến"),
            icon: Image(image: AssetImage('assets/ic_meeting.png')),
          ),
          Image(image: AssetImage('assets/ic_next.png'))
        ],
      ),
    );

  }

  var ic_notification = new Image(
      image: AssetImage('assets/ic_notification.png'), height: 35, width: 50);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            HexColor.fromHex('#FAA244'),
            HexColor.fromHex('#FF8400')
          ])),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello Tien Dat'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                )
              ],
            ),
            flexibleSpace: Image(
              image: AssetImage(
                'assets/ic_toolbar.png',
              ),
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
                          border: Border.all(color: Colors.white, width: 1)),
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
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30.0),
          routeWidget(),
          SizedBox(height: 10.0),
          Image(
              image: AssetImage('assets/ic_line_big.png'),
              color: HexColor.fromHex('#F2F2F2')),
          SizedBox(height: 10.0),
          ExamingWidget(),
          SizedBox(height: 10.0),
          Image(
              image: AssetImage('assets/ic_line_big.png'),
              color: HexColor.fromHex('#F2F2F2')),
          Result(),
          SizedBox(height: 10.0),
          Image(
              image: AssetImage('assets/ic_line_big.png'),
              color: HexColor.fromHex('#F2F2F2')),
          meetingWidget(),
          SizedBox(height: 10.0),
          Image(
              image: AssetImage('assets/ic_line_big.png'),
              color: HexColor.fromHex('#F2F2F2')),
        ],
      ),
    );
  }
}

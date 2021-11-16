import 'package:LearnHub/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TabIntroductionCourcePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabIntroductionState();
  }
}

class TabIntroductionState extends State<TabIntroductionCourcePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget contentWidget() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Align(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Tất quan khoá học',
                style: TextStyle(
                    color: HexColor.fromHex('#212121'),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.00),
              ),
              SizedBox(width: 60.0),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 100),
                    child: Text(
                      'Xem thêm'.toUpperCase(),
                      style: TextStyle(
                        color: HexColor.fromHex('#AA3234'),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.00,
                      ),
                    ),
                  ))
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
                'Nếu phản hồi là một Kĩ năng thì phản hồi thông minh là một nghệ thuật. Nhận thức được tầm quan trọng của phản hồi trong công việc, bạn muốn thấu hiểu đồng nghiệp và các cấp quản lý nhưng lại chưa xác định được điểm bắt đầu. Làm sao để phản hồi thông minh mà vừa học hỏi được từ nhiều góc nhìn vừa tạo cảm giác tích cực cho mọi người xung quanh? Khóa học “Phản hồi thông minh nơi công sở” là chìa khóa giúp xây dựng tư duy phản hồi, giúp bạn lên kế hoạch cho việc thảo luận phản hồi phù hợp với người nghe cũng như cải thiện Kĩ năng lắng nghe. Có được sự cởi mở khi tiếp nhận phản hồi, bạn sẽ giúp mọi người cảm thấy thoải mái trong việc chia sẻ và là nền tảng tạo nên môi trường làm việc lý tưởng.',
                style: TextStyle(
                    color: HexColor.fromHex('#212121'),
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center),
          ),
        )
      ],
    );
  }

  Widget teacherWidget() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Align(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Giảng viên',
                  style: TextStyle(
                      color: HexColor.fromHex('#212121'),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ],
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 0.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Họ tên',
                      style: TextStyle(
                          color: HexColor.fromHex('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 105),
                  Text('Nguyễn Huy Anh',
                      style: TextStyle(
                          color: HexColor.fromHex('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                ],
              )),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image(image: AssetImage('assets/ic_line_big.png')),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 0.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Trình độ',
                      style: TextStyle(
                          color: HexColor.fromHex('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 165),
                  Text('Thạc sĩ',
                      style: TextStyle(
                          color: HexColor.fromHex('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                ],
              )),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image(image: AssetImage('assets/ic_line_big.png')),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 1.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Tuổi',
                      style: TextStyle(
                          color: HexColor.fromHex('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 235),
                  Text('30',
                      style: TextStyle(
                          color: HexColor.fromHex('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                ],
              )),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image(image: AssetImage('assets/ic_line_big.png')),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 1.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Đánh giá',
                      style: TextStyle(
                          color: HexColor.fromHex('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 75),
                  RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
                    itemSize: 30,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: HexColor.fromHex('#AA3234'),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              )),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image(image: AssetImage('assets/ic_line_big.png')),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget documentWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Align(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Tài liệu tham khảo',
                  style: TextStyle(
                      color: HexColor.fromHex('#212121'),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ],
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 6.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              margin: const EdgeInsets.all(10.0),
              child: Wrap(
                children: <Widget>[
                  Text('Văn hoá làm việc tập thể tại các công sở',
                      style: TextStyle(
                          color: HexColor.fromHex('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 0.0),
                  Image(image: AssetImage('assets/ic_download.png'))
                ],
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 6.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              margin: const EdgeInsets.all(10.0),
              child: Wrap(
                children: <Widget>[
                  Text('Văn hoá làm việc tập thể tại các công sở',
                      style: TextStyle(
                          color: HexColor.fromHex('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 0.0),
                  Image(image: AssetImage('assets/ic_download.png'))
                ],
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 6.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              margin: const EdgeInsets.all(10.0),
              child: Wrap(
                children: <Widget>[
                  Text('Văn hoá làm việc tập thể tại các công sở',
                      style: TextStyle(
                          color: HexColor.fromHex('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 0.0),
                  Image(image: AssetImage('assets/ic_download.png'))
                ],
              )),
        ),
      ],
    );
  }

  Widget finishWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Align(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Điều kiện hoàn thành',
                  style: TextStyle(
                      color: HexColor.fromHex('#212121'),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ],
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Align(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Học tập theo đúng lộ trình',
                  style: TextStyle(
                      color: HexColor.fromHex('#212121'),
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal)),
            ],
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 16.0),
          child: Align(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Text('Hoàn thành đầy đủ các bài học và các bài kiểm tra',
                  style: TextStyle(
                      color: HexColor.fromHex('#212121'),
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Container(
                margin: const EdgeInsets.only(left: 25.0, right: 10.0),
                child: Image(image: AssetImage('assets/ic_line_big.png')),
              ),
              SizedBox(height: 10.0),
              contentWidget(),
              SizedBox(height: 10.0),
              Container(
                margin: const EdgeInsets.only(left: 25.0, right: 10.0),
                child: Image(image: AssetImage('assets/ic_line_big.png')),
              ),
              SizedBox(height: 10.0),
              teacherWidget(),
              SizedBox(height: 10.0),
              Container(
                margin: const EdgeInsets.only(left: 25.0, right: 10.0),
                child: Image(image: AssetImage('assets/ic_line_big.png')),
              ),
              SizedBox(height: 10.0),
              documentWidget(),
              SizedBox(height: 10.0),
              Container(
                margin: const EdgeInsets.only(left: 25.0, right: 10.0),
                child: Image(image: AssetImage('assets/ic_line_big.png')),
              ),
              SizedBox(height: 10.0),
              finishWidget()
            ],
          ),
        ),
      ),
    );
  }
}

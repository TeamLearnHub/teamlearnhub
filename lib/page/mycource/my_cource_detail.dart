import 'dart:convert';
import 'package:LearnHub/model/CourseClassResponse.dart';
import 'package:LearnHub/model/CourseDetailResponse.dart';
import 'package:LearnHub/page/classes/classes_detail.dart';
import 'package:LearnHub/utils/Utils.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class MyCourseDetailPage extends StatefulWidget {
  final String id;

  MyCourseDetailPage({this.id});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCourceDetailState();
  }
}

class MyCourceDetailState extends State<MyCourseDetailPage> {
  String accessToken;
  String urlCourseDetail = "http://118.70.236.144:84/api/v1.0/course/";
  String urlCourseClass =
      "http://118.70.236.144:84/api/v1.0/course/class?courseId=";
  CourseDetailResponse courseResponse;
  CourseClassResponse courseClassResponse;
  Future<List<CourseDetailModel>> futureCourse;
  Future<List<CourseClassModel>> futureClass;
  List classList = [
    {
      "Name":"Lớp 001",
      "Teacher": "Giáo viên: Nguyễn Kiên",
      "CountMember": "Số lượng học viên tham gia: 10/20",
      "Time": "Start 20/09/2021 End 30/10/2021"
    },
    {
      "Name":"Lớp 002",
      "Teacher": "Giáo viên: Nguyễn Kiên",
      "CountMember": "Số lượng học viên tham gia: 10/20",
      "Time": "Start 20/09/2021 End 30/10/2021"
    },
    {
      "Name":"Lớp 003",
      "Teacher": "Giáo viên: Nguyễn Kiên",
      "CountMember": "Số lượng học viên tham gia: 10/20",
      "Time": "Start 20/09/2021 End 30/10/2021"
    },
    {
      "Name":"Lớp 005",
      "Teacher": "Giáo viên: Nguyễn Kiên",
      "CountMember": "Số lượng học viên tham gia: 10/20",
      "Time": "Start 20/09/2021 End 30/10/2021"
    },
    {
      "Name":"Lớp 006",
      "Teacher": "Giáo viên: Nguyễn Kiên",
      "CountMember": "Số lượng học viên tham gia: 10/20",
      "Time": "Start 20/09/2021 End 30/10/2021"
    }
    ,
    {
      "Name":"Lớp 004",
      "Teacher": "Giáo viên: Nguyễn Kiên",
      "CountMember": "Số lượng học viên tham gia: 10/20",
      "Time": "Start 20/09/2021 End 30/10/2021"
    }
  ];

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          margin: EdgeInsets.all(10.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          color: HexColor.fromHex('#FFFFFF'),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                      label: Utils.customText(text: "Khoá học tiếng anh")),
                ),
                Utils.customText(
                    text: "Tiếng anh Toeic", fontWeight: FontWeight.bold),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orangeAccent),
                            padding: MaterialStateProperty.all(EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8)),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 16))),
                        child: Text(
                          'Chưa đăng ký',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton.icon(
                          icon: Icon(
                            Icons.star_half,
                            color: Colors.black,
                            size: 18,
                          ),
                          label: Utils.customText(text: "4.8")),
                      TextButton.icon(
                          icon: Icon(
                            Icons.timelapse,
                            color: Colors.black,
                            size: 18,
                          ),
                          label: Utils.customText(text: "6 tuần"))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: Colors.black,
                        size: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Utils.customText(text: "2-3 giờ mỗi tuần"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.group,
                        color: Colors.black,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Utils.customText(
                            text: "Số lượng học viên tham gia: 30/50"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.description_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Utils.customText(text: "Chứng chỉ nội bộ"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Utils.customText(
                      text:
                          "Tiếng anh Toeic cơ bản là khoá học cung cấp kiến thức cho người đi làm giao tiếp công việc"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Utils.customText(
                      text: "Lựa chọn lớp học",
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 16),
                  child: Utils.customText(
                      text: "300 người đã đăng ký",
                      color: Colors.black,
                      size: 14.0),
                ),
                Container(
                  margin: EdgeInsets.only(top:8),
                  height: 450,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        itemCount: classList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = classList[index];
                          return Container(
                            margin: EdgeInsets.only(top:8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Center(
                                    child: Utils.customText(
                                        text: item["Name"],
                                        color: Colors.blue,
                                        size: 16.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Utils.customText(
                                        text: item["Teacher"],
                                        color: Colors.black,
                                        size: 16.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Utils.customText(
                                        text: item["CountMember"],
                                        color: Colors.black,
                                        size: 16.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Utils.customText(
                                        text: item["Time"],
                                        color: Colors.black,
                                        size: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
        CourceFAQView()
      ],
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
              SizedBox(height: 10.0),
              learningWidget(),
              detailCourse(),
              SizedBox(height: 50.0)
            ],
          ),
        ),
      ),
    );
  }
}
class CourceFAQView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CourceFAQView();
  }
}
class _CourceFAQView extends State<CourceFAQView> {
  bool isEmail = false;
  String typeFAQ = "";
  List listFAQ = [
    {
      "Name":"Thông tin khoá học",
      "Value":"info"
    },
    {
      "Name":"Bài giảng/Giáo trình",
      "Value":"syllabus"
    },
    {
      "Name":"FAQ",
      "Value":"faq"
    },
    {
      "Name":"Cách đăng ký khoá học",
      "Value":"register_cource"
    },
    {
      "Name":"Chia sẻ khoá học",
      "Value":"share_cource"
    }
  ];
  Widget viewDetailFAQ(type){
      if(type == "info"){
        return Container(
          padding: const EdgeInsets.only(left:16.0,right:8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Utils.customText(text:"Tiếng anh Toeic cơ bản là khoá học cung cấp kiến thức cho người đi làm giao tiếp công việc"),
              Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: Utils.customText(text:"Tóm tắt",fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top:8),
                padding:EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Utils.customText(text:"Tổ chức: đại học qg"),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Utils.customText(text:"Chủ đề: tiếng anh"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Utils.customText(text:"Chủ đề: tiếng anh"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Utils.customText(text:"Trình độ: cơ bản"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Utils.customText(text:"Điều kiện: không"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Utils.customText(text:"Thi: có"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Utils.customText(text:"Chứng chỉ: Nội bộ"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Utils.customText(text:"Ngôn ngữ: Tiếng Anh"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Utils.customText(text:"Bản ghi: Tiếng việt"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Utils.customText(text:"Chương trình liên kết"),
                    ),
                  ],
                ),
              ),
            ],),
        );
      }else if(type=="syllabus"){
        return Container(
          padding: const EdgeInsets.only(left:16.0,right:8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Utils.customText(text:"Chương 1: Python basic",fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left:16),
                child: Utils.customText(text:"1. Giới thiệu Python (Time 00:40:20)"),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left:16),
                child: Utils.customText(text:"2. Core Python (Time 00:30:20)"),
              ),
              Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: Utils.customText(text:"Chương 2: Kiểu cấu trúc",fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left:16),
                child: Utils.customText(text:"3. Chức năng (Time 00:20:20)"),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left:16),
                child: Utils.customText(text:"4. Thực hành đơn giản (Time 00:20:20)"),
              ),
            ],),
        );
      }
      return Container(
        padding: const EdgeInsets.only(left:16.0,right:8),
        child: Utils.customText(text:"Chưa có thông tin"),
      );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

     return Card(
       margin: EdgeInsets.all(10.0),
       shape:
       RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
       color: HexColor.fromHex('#FFFFFF'),
       elevation: 2,
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Padding(
               padding: const EdgeInsets.only(top:8.0),
               child: LabeledCheckbox(
                 value: isEmail,
                 width: 16,
                 height: 16,
                 label: "Tôi muốn nhận email từ LH về những thông tin khóa học ABC",
                 color: Colors.black,
                 padding: EdgeInsets.all(0),
                 onChanged: (value) {
                    setState(() {
                      isEmail = !isEmail;
                    });
                 },
               ),
             ),
             for(int i=0;i<listFAQ.length;i++)
               Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   ElevatedButton(
                     onPressed: () {
                       setState(() {
                         typeFAQ = typeFAQ == "" || typeFAQ != listFAQ[i]["Value"] ? listFAQ[i]["Value"] : "";
                       });
                     },
                     style: ButtonStyle(
                         elevation: MaterialStateProperty.all<double>(0),
                         backgroundColor: MaterialStateProperty.all(Colors.white),
                         padding: MaterialStateProperty.all(EdgeInsets.only(left:8,right:8)),
                         textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Utils.customText(text:listFAQ[i]["Name"],fontWeight:typeFAQ == listFAQ[i]["Value"] ? FontWeight.bold : FontWeight.normal ),
                         Icon(typeFAQ == listFAQ[i]["Value"] ?  Icons.expand_less_sharp :Icons.expand_more_rounded,color: Colors.black,),
                       ],)
                   ),
                   if(typeFAQ == listFAQ[i]["Value"])
                     viewDetailFAQ(listFAQ[i]["Value"]),
                 ],
               ),

           ],

         ),
       ),
     );
  }

}

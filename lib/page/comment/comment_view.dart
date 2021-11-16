import 'package:LearnHub/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() {
    // TODO: implement createState
    return _CommentPageState();
  }
}

class _CommentPageState extends State<CommentPage> {
  bool a = false;
  List<String> _comment = [];
  List<String> _question = [];
  String test = null;

  void _addComment(String val) {
    setState(() {
      _comment.add(val);
    });
  }

  void _addQuestion(String val) {
    setState(() {
      _question.add(val);
      test = val;
      print(test);
    });
  }

  Widget _buildCommentList() {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index < _comment.length) {
            return _buildCommentItem(_comment[index]);
          }
        });
  }

  Widget _buildQuestionList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _question.length,
        itemBuilder: (context, index) {
          if (index < _question.length) {
            return _buildQuestionItem(_question[index]);
          }
        });
  }

  Widget _buildCommentItem(String comment) {
    return Container(
      constraints: BoxConstraints(maxWidth: 380),
      color: HexColor.fromHex('FEFAF5'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
                left: 5.0, right: 10.0, bottom: 15.0, top: 15.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avartar.jpg'),
              radius: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 25.0, bottom: 8.0),
                    child: Text(
                      'Nguyễn Tiến Đạt',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 7.0, top: 25.0, bottom: 8.0),
                    child: Text(' | 12h',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16.0)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 0, right: 5.0, bottom: 10.0, top: 2),
                width: 300,
                child: Text(comment,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style:
                        TextStyle(fontSize: 15.5, color: HexColor.fromHex('#212121'))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 5.0),
                    child: Image(image: AssetImage('assets/ic_like.png')),
                  ),
                  SizedBox(width: 10),
                  Text('17',
                      style: TextStyle(
                          color: HexColor.fromHex('#AA3234'), fontSize: 16.0)),
                  SizedBox(width: 30.0),
                  Image(image: AssetImage('assets/ic_unlike.png')),
                  SizedBox(width: 30.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        a = true;
                      });
                    },
                    child: Image(image: AssetImage('assets/ic_comment.png')),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Text('2',
                        style: TextStyle(
                            color: HexColor.fromHex('#AA3234'), fontSize: 16.0)),
                  )
                ],
              ),
              Visibility(child: question(), visible: a)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionItem(String question) {
    if (question != null) {
      return Container(
        color: HexColor.fromHex('FEFAF5'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  left: 15.0, right: 10.0, bottom: 15.0, top: 15.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/avartar.jpg'),
                radius: 30,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                          left: 5.0, right: 5.0, top: 25.0, bottom: 8.0),
                      child: Text(
                        'Nguyễn Manh Cuong',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 5.0, top: 25.0, bottom: 8.0),
                      child: Text(' | 12h',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16.0)),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 0, right: 5.0, bottom: 10.0, top: 2),
                  width: 200,
                  child: Text(question,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(
                          fontSize: 15.5, color: HexColor.fromHex('#212121'))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 0.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image(image: AssetImage('assets/ic_like.png')),
                          SizedBox(width: 10),
                          Text('17',
                              style: TextStyle(
                                  color: HexColor.fromHex('#AA3234'), fontSize: 16.0)),
                          SizedBox(width: 30.0),
                          Image(image: AssetImage('assets/ic_unlike.png')),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Text("", style: TextStyle(fontSize: 25));
    }
  }

  Widget question() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 320,
          height: 80,
          child: TextFormField(
            onFieldSubmitted: (String submittedStr) {
              _addQuestion(submittedStr);
            },
            autocorrect: true,
            style: TextStyle(fontSize: 18, height: 2.5),
            decoration: InputDecoration(
                prefixIcon: CircleAvatar(
                    backgroundImage: AssetImage('assets/avartar.jpg'),
                    radius: 25),
                hintStyle: TextStyle(color: HexColor.fromHex('#434343')),
                border: InputBorder.none,
                filled: true,
                contentPadding: const EdgeInsets.all(10.0),
                hintText: "Phản hồi của bạn"),
          ),
        ),
        _buildQuestionItem(test)
//        Expanded(child: SizedBox(height: 300.0, child: _buildQuestionList()))
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      a = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 0.5,
            height: 80,
            child: TextFormField(
              onFieldSubmitted: (String submittedStr) {
                _addComment(submittedStr);
              },
              autocorrect: true,
              style: TextStyle(fontSize: 18, height: 2.5),
              decoration: InputDecoration(
                  prefixIcon: CircleAvatar(
                      backgroundImage: AssetImage('assets/avartar.jpg'),
                      radius: 25),
                  hintStyle: TextStyle(color: HexColor.fromHex('#434343')),
                  border: InputBorder.none,
                  filled: true,
                  contentPadding: const EdgeInsets.all(10.0),
                  hintText: "Bình luận của bạn"),
            ),
          ),
          Expanded(child: _buildCommentList())
        ],
      ),
    );
  }
}

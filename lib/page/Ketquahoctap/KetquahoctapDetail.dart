import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KetQuaHtDetail extends StatefulWidget {
  @override
  _ketquaht createState() => _ketquaht();
}

class _ketquaht extends State<KetQuaHtDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 40,
                  right: 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Color(0xFFAA3234),
                      size: 32,
                    ),
                    onPressed: () => Navigator.pop(context),
                  )),
              Positioned(
                  top: 80,
                  child: Container(
                    height: MediaQuery.of(context).size.height-80,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 10,
                          child: Text(
                            "Phản hồi kết quả học tập",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.height / 30,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Tên khóa học",
                            style: TextStyle(fontSize: MediaQuery.of(context).size.height / 45, color: Colors.black),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Nhập tên khóa học",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.height / 48),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Nội dung bạn cần phản ánh",
                            style: TextStyle(fontSize: MediaQuery.of(context).size.height / 45, color: Colors.black),
                          ),
                        ),
                        TextField(
                          maxLines: 6,
                          decoration: InputDecoration(
                            hintText: "Nhập nội dung bạn cần phản ánh",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.height / 48),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  )),
              Positioned(left: 0, right: 0, bottom: 0,child: Container(
                decoration: BoxDecoration(

                    gradient:LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.orange[200],Colors.orange],)
                ),
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> KetQuaHtDetail()));
                  },child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height/15,
                  width: MediaQuery.of(context).size.width/ 2.4,
                  child: Text("PHẢN HỒI", style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),),
                ),),
              ))
            ],
          )),
    );
  }
}

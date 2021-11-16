
import 'package:LearnHub/page/home/home_tab_view.dart';
import 'package:flutter/material.dart';
class Dethi extends StatefulWidget{
  @override
  _dethi createState() =>_dethi();

}
class _dethi extends State<Dethi>{
  String titile= "Đề thi";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: (){
            Navigator.pop(context);
          }),
          title: Text(titile,style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800)),

        ),
        body:Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Xin lỗi!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                  Text("Bạn vui lòng đăng nhập bằng máy tính"),
                  Text("hoặc laptop để xem đề thi nhé"),
                ],
              ),
            ),
            Positioned(
              left: 0, right: 0,bottom: 0,
              child:    Container(
                decoration: BoxDecoration(

                    gradient:LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.orange[200],Colors.orange],)
                ),
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeTabPage()));
                  },child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height/15,
                  width: MediaQuery.of(context).size.width/ 2.4,
                  child: Text("OK", style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),),
                ),),
              ),)
          ],
        )
    );
  }

}
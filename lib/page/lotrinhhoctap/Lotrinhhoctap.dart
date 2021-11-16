import 'package:flutter/material.dart';


class LotrinhHoctap{
  String name;
  String idclass;
  String week;
  String content;

  LotrinhHoctap(this.name, this.idclass, this.week, this.content);


}

class Lotrinhhoctap extends StatefulWidget {
  @override
  _lotrinhhoctap createState() => _lotrinhhoctap();
}

class _lotrinhhoctap extends State<Lotrinhhoctap> {
  String titile = "Lộ trình học tập";
  List<LotrinhHoctap> listlt = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listlt.add(new LotrinhHoctap(
        "Kỹ năng quản lý đội nhóm", "005", "1-7", "Hoàn thành bài 1- bài3 "));
    listlt.add(new LotrinhHoctap(
        "Kỹ năng quản lý đội nhóm", "005", "1-7", "Hoàn thành bài 1- bài3 "));
    listlt.add(new LotrinhHoctap(
        "Kỹ năng quản lý đội nhóm", "005", "1-7", "Hoàn thành bài 1- bài3 "));
    listlt.add(new LotrinhHoctap(
        "Kỹ năng quản lý đội nhóm", "005", "1-7", "Hoàn thành bài 1- bài3 "));
    listlt.add(new LotrinhHoctap(
        "Kỹ năng quản lý đội nhóm", "005", "1-7", "Hoàn thành bài 1- bài3 "));
    listlt.add(new LotrinhHoctap(
        "Kỹ năng quản lý đội nhóm", "005", "1-7", "Hoàn thành bài 1- bài3 "));
    listlt.add(new LotrinhHoctap(
        "Kỹ năng quản lý đội nhóm", "005", "1-7", "Hoàn thành bài 1- bài3 "));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          titile,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFE5E5E5),
        child: ListView.builder(
            itemCount: listlt.length,
            itemBuilder: (BuildContext context, int positino) {
              return ListLotrinh(
                  listlt[positino].name,
                  listlt[positino].idclass,
                  listlt[positino].week,
                  listlt[positino].content,
                  context);
            }),
      ),
    );
  }

  Widget ListLotrinh(String name, String idclass, String week, String content,
      BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20 ,left: 18,right:
      18,bottom: 20),
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      height: MediaQuery.of(context).size.height / 3,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFFF5F6F9), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 7,),
                  Text(
                    name,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height/50, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "Mã lớp: " + idclass,
                    style: TextStyle(color: Color(0xFFE8943A),fontSize: MediaQuery.of(context).size.height/57),
                  ),
                ],)),
          Divider(
            color: Colors.brown,
          ),
          Expanded(
            flex: 2,
            child:   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Tuần",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/53, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Nội dung",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/53, fontWeight: FontWeight.w700),
                ),

              ],
            ),),
          Divider(
            color: Colors.brown,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  week,
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/55),
                ),
                Text(
                  content,
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/55),
                ),
              ],
            ),),
          Divider(
            color: Colors.brown,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  week,
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/55),
                ),
                Text(
                  content,
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/55),
                ),
              ],
            ),),
        ],
      ),
    );
  }
}

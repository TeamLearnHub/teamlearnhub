
import 'package:flutter/material.dart';

class Meetting{
  String nameMeetting;
  String start;
  String end;
  String status;

  Meetting(this.nameMeetting, this.start, this.end, this.status);
}
class Hoptructuyen extends StatefulWidget{
  @override
  _hoptructuyen createState() =>_hoptructuyen();

}
class _hoptructuyen extends State<Hoptructuyen>{
  List<Meetting> listmeet= List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listmeet.add(new Meetting("Giao ban đầu kì", "10/02/2020 - 10:30", "10/02/2020 - 12:00", "Đã xong"));
    listmeet.add(new Meetting("Bình bầu ứng viên", "10/02/2020 - 10:30", "10/02/2020 - 12:00", "Đang họp"));
    listmeet.add(new Meetting("Tổng kết họp kì 1", "10/02/2020 - 10:30", "10/02/2020 - 12:00", "Đang họp"));
    listmeet.add(new Meetting("Giao ban đầu kì", "10/02/2020 - 10:30", "10/02/2020 - 12:00", "Chuẩn bị"));
    listmeet.add(new Meetting("Giao ban đầu kì", "10/02/2020 - 10:30", "10/02/2020 - 12:00", "Chuẩn bị"));
    listmeet.add(new Meetting("Giao ban đầu kì", "10/02/2020 - 10:30", "10/02/2020 - 12:00", "Chuẩn bị"));

  }
  DataTable databody(){
    return DataTable(
        horizontalMargin: 10,

        columns: [
          DataColumn(label: Text("Tên cuộc họp", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),), numeric: false, tooltip: "This is name meetting"),
          DataColumn(label: Text("Bắt đầu",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black)), numeric: false, tooltip: "Giờ bắt đầu"),
          DataColumn(label: Text("Kết thúc",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black)), numeric: false, tooltip: "Giờ kết thúc"),
          DataColumn(label: Text("Tên cuộc họp",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black)), numeric: false, tooltip: "Trạng thái"),
        ],
        rows: listmeet.map((meet)=> DataRow(cells: [
          DataCell(Text(meet.nameMeetting)),
          DataCell(Text(meet.start)),
          DataCell(Text(meet.end)),
          DataCell(Text(meet.status)),
        ])).toList()
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: (){
            Navigator.pop(context);
          }),
          title: Text("Họp trực tuyến", style: TextStyle(color: Colors.black,
              fontSize: 28,fontWeight: FontWeight.w700),),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: databody(),
          ),
        )
    );
  }

}
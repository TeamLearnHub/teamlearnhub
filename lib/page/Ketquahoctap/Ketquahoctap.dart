import 'package:flutter/material.dart';

import 'KetquahoctapDetail.dart';

class KetQuaHt {
  String url;
  String name;
  String nameclass;
  String idclass;
  String status;
  String kq;

  KetQuaHt(
      this.url, this.name, this.nameclass, this.idclass, this.status, this.kq);
}

class Ketquahoctap extends StatefulWidget {
  @override
  _ketquahoctap createState() => _ketquahoctap();
}

class _ketquahoctap extends State<Ketquahoctap> {
  String titile = "Kết quả học tập";

  List<KetQuaHt> listKq = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listKq.add(
      new KetQuaHt(
          "https://baotonghop.vn/wp-content/uploads/2019/11/6-1574407016259967017228-crop-1574407158062723572964.jpg",
          "Kỹ năng quả lý thời gian",
          "K12",
          "005",
          "Done",
          "Đã có chứng chỉ"),
    );
    listKq.add(
      new KetQuaHt(
          "https://baotonghop.vn/wp-content/uploads/2019/11/6-1574407016259967017228-crop-1574407158062723572964.jpg",
          "Kỹ năng quả lý thời gian",
          "K12",
          "005",
          "Done",
          "Đã có chứng chỉ"),
    );
    listKq.add(
      new KetQuaHt(
          "https://baotonghop.vn/wp-content/uploads/2019/11/6-1574407016259967017228-crop-1574407158062723572964.jpg",
          "Kỹ năng quả lý thời gian",
          "K12",
          "005",
          "Done",
          "Đã có chứng chỉ"),
    );
    listKq.add(
      new KetQuaHt(
          "https://baotonghop.vn/wp-content/uploads/2019/11/6-1574407016259967017228-crop-1574407158062723572964.jpg",
          "Kỹ năng quả lý thời gian",
          "K12",
          "005",
          "Done",
          "Đã có chứng chỉ"),
    );
    listKq.add(
      new KetQuaHt(
          "https://baotonghop.vn/wp-content/uploads/2019/11/6-1574407016259967017228-crop-1574407158062723572964.jpg",
          "Kỹ năng quả lý thời gian",
          "K12",
          "005",
          "Done",
          "Đã có chứng chỉ"),
    );
    listKq.add(
      new KetQuaHt(
          "https://baotonghop.vn/wp-content/uploads/2019/11/6-1574407016259967017228-crop-1574407158062723572964.jpg",
          "Kỹ năng quả lý thời gian",
          "K12",
          "005",
          "Done",
          "Đã có chứng chỉ"),
    );
    listKq.add(
      new KetQuaHt(
          "https://baotonghop.vn/wp-content/uploads/2019/11/6-1574407016259967017228-crop-1574407158062723572964.jpg",
          "Kỹ năng quả lý thời gian",
          "K12",
          "005",
          "Done",
          "Đã có chứng chỉ"),
    );
    listKq.add(
      new KetQuaHt(
          "https://baotonghop.vn/wp-content/uploads/2019/11/6-1574407016259967017228-crop-1574407158062723572964.jpg",
          "Kỹ năng quả lý thời gian",
          "K12",
          "005",
          "Done",
          "Đã có chứng chỉ"),
    );
    listKq.add(
      new KetQuaHt(
          "https://baotonghop.vn/wp-content/uploads/2019/11/6-1574407016259967017228-crop-1574407158062723572964.jpg",
          "Kỹ năng quả lý thời gian",
          "K12",
          "005",
          "Done",
          "Đã có chứng chỉ"),
    );
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
          title: Text(titile,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w800)),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 70),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFE5E5E5),
              child: ListView.builder(
                  itemCount: listKq.length,
                  itemBuilder: (BuildContext context, int positino) {
                    return ListKetqua(
                        listKq[positino].url,
                        listKq[positino].name,
                        listKq[positino].nameclass,
                        listKq[positino].idclass,
                        listKq[positino].status,
                        listKq[positino].kq,
                        context);
                  }),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.orange[200], Colors.orange],
                      )),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KetQuaHtDetail()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 2.4,
                      child: Text(
                        "PHẢN HỒI",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }

  Widget ListKetqua(String url, String name, String nameclass, String idclass,
      String status, String ketqua, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
      height: MediaQuery.of(context).size.height / 4.5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 25,
                      backgroundImage: NetworkImage(url),
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.height / 48,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Lớp " + nameclass + " | " + "Mã lớp " + idclass,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFE8943A),
                              fontSize:
                                  MediaQuery.of(context).size.height / 62),
                        )
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            color: Colors.brown,
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Trạng thái",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 58)),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            status,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height / 55),
                          )
                        ],
                      )),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Ket qua",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 58),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            ketqua,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height / 55),
                          )
                        ],
                      )),
                ],
              ))
        ],
      ),
    );
  }
}

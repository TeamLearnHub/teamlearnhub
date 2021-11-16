import 'package:LearnHub/constant/ListDropMenuItem.dart';
import 'package:LearnHub/model/Giaodich.dart';
import 'package:flutter/material.dart';

class LichSu extends StatefulWidget {
  @override
  _lichSu createState() => _lichSu();
}

class _lichSu extends State<LichSu> {
  String lichsu = null;
  bool chon = false;
  bool ishuy = false;
  List<amomo> listgd = List();
  List<amomo> listgd1 = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listgd.add(new amomo(
        "https://cuocsongdungnghia.com/wp-content/uploads/2017/12/thoi-gian.jpg",
        "Kỹ năng quản lý thời gian",
        "PT13351",
        "MOB",
        "01/01/2020",
        true,
        "00001",
        "Chưa có",
        "cc",
        "01/01/2020",
        "03/03/2020"));
    listgd.add(new amomo(
        "https://tygiadola.com/Content/News/2017/02/16/10-bi-quyet-quan-ly-tien-bac-khien-nguoi-giau-ngay-cang-giau-len_16845671.jpg",
        "Kỹ năng quản lý thời gian",
        "PT13351",
        "MOB",
        "01/01/2020",
        true,
        "00001",
        "Đã có",
        "d",
        "01/01/2020",
        "03/03/2020"));
    listgd.add(new amomo(
        "https://cuocsongdungnghia.com/wp-content/uploads/2017/12/thoi-gian.jpg",
        "Kỹ năng quản lý thời gian",
        "PT13351",
        "MOB",
        "01/01/2020",
        true,
        "00001",
        "Đang chờ cấp",
        "tt",
        "01/01/2020",
        "03/03/2020"));
    listgd.add(new amomo(
        "https://tygiadola.com/Content/News/2017/02/16/10-bi-quyet-quan-ly-tien-bac-khien-nguoi-giau-ngay-cang-giau-len_16845671.jpg",
        "Kỹ năng quản lý thời gian",
        "PT13351",
        "MOB",
        "01/01/2020",
        true,
        "00001",
        "Chưa có",
        "cc",
        "01/01/2020",
        "03/03/2020"));
    listgd.add(new amomo(
        "https://cuocsongdungnghia.com/wp-content/uploads/2017/12/thoi-gian.jpg",
        "Kỹ năng quản lý thời gian",
        "PT13351",
        "MOB",
        "01/01/2020",
        true,
        "00001",
        "Chưa có",
        "cc",
        "01/01/2020",
        "03/03/2020"));
    listgd.add(new amomo(
        "https://tygiadola.com/Content/News/2017/02/16/10-bi-quyet-quan-ly-tien-bac-khien-nguoi-giau-ngay-cang-giau-len_16845671.jpg",
        "Kỹ năng quản lý thời gian",
        "PT13351",
        "MOB",
        "01/01/2020",
        true,
        "00001",
        "Đã có",
        "d",
        "01/01/2020",
        "03/03/2020"));
    listgd.add(new amomo(
        "https://cuocsongdungnghia.com/wp-content/uploads/2017/12/thoi-gian.jpg",
        "Kỹ năng quản lý thời gian",
        "PT13351",
        "MOB",
        "01/01/2020",
        true,
        "00001",
        "Đang chờ cấp",
        "tt",
        "01/01/2020",
        "03/03/2020"));
    listgd1 = listgd;
  }

  @override
  Widget build(BuildContext context) {
    ListDropMenuItem.dropLichsu();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Text("Lịch sử giao dịch",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 22)),
        actions: <Widget>[
          Visibility(
              visible: ishuy,
              child: Container(
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text(
                    "Chọn",
                    style: TextStyle(color: Colors.black54),
                  ),
                  onPressed: () {
                    setState(() {
                      chon = true;
                    });
                  },
                ),
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF5F6F9),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 70),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: listgd1.length,
                  itemBuilder: (BuildContext context, int positino) {
                    return ListLichsu(
                        listgd1[positino].url,
                        listgd1[positino].namegd,
                        listgd1[positino].classid,
                        listgd1[positino].classname,
                        listgd1[positino].datedk,
                        listgd1[positino].status,
                        listgd1[positino].iddk,
                        listgd1[positino].chungchi,
                        listgd1[positino].datestart,
                        listgd1[positino].dateend,
                        context);
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 10),
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300]),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: lichsu,
                    hint: Text("Tất cả giao dịch"),
                    isExpanded: true,
                    items: ListDropMenuItem.listlichsu,
                    onChanged: (value) {
                      setState(() {
                        lichsu = value;
                        print(value);
                      });
                      _filter(value);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ListLichsu(
      String url,
      String namegd,
      String classid,
      String classname,
      String datedk,
      bool status,
      String iddk,
      String chungchi,
      String datestart,
      String dateend,
      BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFE5E5E5),
//              boxShadow:[
//                BoxShadow(
//                  color: Colors.grey,
//                  blurRadius: 4.0, // soften the shadow
//                  //extend the shadow
//                  offset: Offset(
//                    5.0, // Move to right 10  horizontally
//                    5.0, // Move to bottom 10 Vertically
//                  ),
//                )
//              ] ,
              ),
              margin: EdgeInsets.only(left: 20, right: 20, top: 35),
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 9,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: CircleAvatar(
                          radius: MediaQuery.of(context).size.height / 30,
                          backgroundImage: NetworkImage(url),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 4,
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FittedBox(
                                      child: Text(
                                    namegd,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )),
                                  SizedBox(height: 5),
                                  Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      child: FittedBox(
                                        child: Text(
                                            "Lớp " +
                                                classname +
                                                " | " +
                                                "Mã lớp " +
                                                classid,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFE8943A))),
                                      ))
                                ],
                              ),
                            )),
                        Visibility(visible: chon, child: Text("aa")),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60),
                              RichText(
                                text: TextSpan(
                                  text: 'Ngày đăng kí ',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              55,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: datedk,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60),
                              RichText(
                                text: TextSpan(
                                  text: 'Trạng thái \n',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              55,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: status ? "Active" : "None",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60),
                              RichText(
                                text: TextSpan(
                                  text: 'Ngày bắt đầu \n',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              55,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: datestart,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60),
                              RichText(
                                text: TextSpan(
                                  text: 'Mã đăng kí \n',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              55,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: iddk,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60),
                              RichText(
                                text: TextSpan(
                                  text: 'Chứng chỉ \n',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              55,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: chungchi,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60),
                              RichText(
                                text: TextSpan(
                                  text: 'Ngày kết thúc \n',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              55,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: dateend,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  _filter(String value) {
    if (value == "all") {
      setState(() {
        ishuy = false;
        chon = false;
        listgd1 = listgd;
      });
    }
    if (value == "khm") {
      setState(() {
        ishuy = false;
        chon = false;
        listgd1 = listgd;
      });
    }
    if (value == "dctc") {
      setState(() {
        chon = false;
        ishuy = false;
        listgd1 = listgd
            .where((u) => u.ischungchi.toLowerCase().contains("d"))
            .toList();
      });
    }
    if (value == "cccc") {
      setState(() {
        ishuy = false;
        chon = false;
        listgd1 = listgd
            .where((u) => u.ischungchi.toLowerCase().contains("cc"))
            .toList();
      });
    }
    if (value == "dcc") {
      setState(() {
        ishuy = false;
        chon = false;
        listgd1 = listgd
            .where((u) => u.ischungchi.toLowerCase().contains("tt"))
            .toList();
      });
    }

    if (value == "huy") {
      setState(() {
        ishuy = true;
      });
    }
  }
}

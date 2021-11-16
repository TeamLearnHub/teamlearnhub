import 'package:LearnHub/constant/ListDropMenuItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _setting createState() => _setting();
}

class _setting extends State<Setting> {
  String gt = null;
  String vtcv = null;
  String dvct = null;
  String ttlv = null;


  @override
  Widget build(BuildContext context) {
    ListDropMenuItem.loadData();
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
            "Cài đặt chung",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Thông tin cá nhân",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        letterSpacing: 1),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        "Mã nhân viên",
                        style: TextStyle(fontSize: 16, letterSpacing: 1),
                      )),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 13,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey[400], width: 1),
                    ),
                    child: Text(
                      "Ph06522",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        "Mã chấm công",
                        style: TextStyle(fontSize: 16, letterSpacing: 1),
                      )),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height / 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey[400], width: 1),
                    ),
                    child: Text(
                      "18",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 5),
                    child: Text(
                      "Họ tên",
                      style: TextStyle(fontSize: 16, letterSpacing: 1),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 13,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey[400], width: 1),
                    ),
                    child: Text(
                      "Trần Văn Kim Cương",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 5),
                    child: Text(
                      "Ngày sinh",
                      style: TextStyle(fontSize: 16, letterSpacing: 1),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height / 13,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey[400], width: 1),
                    ),
                    child: Text(
                      "30/05/1999",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text("Giới tính",
                          style: TextStyle(fontSize: 16, letterSpacing: 1))),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      height: MediaQuery.of(context).size.height / 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey[400], width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            value: gt,
                            hint: Text(
                              "Nam",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            isExpanded: true,
                            items: ListDropMenuItem.listGt,
                            onChanged: (value) {
                              setState(() {
                                gt = value;
                              });
                            }),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text("Vị trí công việc",
                          style: TextStyle(fontSize: 16, letterSpacing: 1))),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.of(context).size.height / 13,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400], width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            isExpanded: true,
                            value: vtcv,
                            hint: Text(
                              "Quản lý cấp cao",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            items: ListDropMenuItem.listvtcv,
                            onChanged: (value) {
                              setState(() {
                                vtcv = value;
                              });
                            }),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text("Đơn vị công tác",
                          style: TextStyle(fontSize: 16, letterSpacing: 1))),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.of(context).size.height / 13,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey[400], width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            value: dvct,
                            isExpanded: true,
                            hint: Text("Phòng kinh doanh",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                            items: ListDropMenuItem.listdvct,
                            onChanged: (value) {
                              setState(() {
                                dvct = value;
                              });
                            }),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text("Ngày thử việc",
                          style: TextStyle(fontSize: 16, letterSpacing: 1))),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height / 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey[400], width: 1),
                    ),
                    child: Text("30/05/1999",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text("Ngày lên nhân viên chính thức",
                          style: TextStyle(fontSize: 16, letterSpacing: 1))),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height / 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey[400], width: 1),
                    ),
                    child: Text("30/05/1999",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text("Email",
                          style: TextStyle(fontSize: 16, letterSpacing: 1))),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height / 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey[400], width: 1),
                    ),
                    child: Text("tranvankimcuong@gmail.com",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text("Trạng thái làm việc",
                          style: TextStyle(fontSize: 16, letterSpacing: 1))),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.of(context).size.height / 13,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey[400], width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            value: ttlv,
                            hint: Text("Đang làm việc",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                            isExpanded: true,
                            items: ListDropMenuItem.listttlv,
                            onChanged: (value) {
                              setState(() {
                                ttlv = value;
                              });
                            }),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text("Đổi mật khẩu",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color: Color(0xFFAA3234))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )));
  }
}

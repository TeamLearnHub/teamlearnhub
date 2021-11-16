import 'package:flutter/material.dart';

class ListDropMenuItem {
  static List<DropdownMenuItem<String>> listGt = [];
  static List<DropdownMenuItem<String>> listvtcv = [];
  static List<DropdownMenuItem<String>> listdvct = [];
  static List<DropdownMenuItem<String>> listttlv = [];
  static List<DropdownMenuItem<String>> listlichsu = [];

  static void dropLichsu() {
    listlichsu = [];
    // list dropmenu lịch sử
    listlichsu.add(DropdownMenuItem(
      child: Text("Tất cả giao dịch"),
      value: "all",
    ));
    listlichsu.add(DropdownMenuItem(
      child: Text("Khóa học mới"),
      value: "khm",
    ));
    listlichsu.add(DropdownMenuItem(
      child: Text("Khóa học đã có chứng chỉ"),
      value: "dctc",
    ));
    listlichsu.add(DropdownMenuItem(
      child: Text("Khóa học chưa có chứng chỉ"),
      value: "cccc",
    ));
    listlichsu.add(DropdownMenuItem(
      child: Text("Đang chờ cấp chứng chỉ"),
      value: "dcc",
    ));
    listlichsu.add(DropdownMenuItem(
      child: Text("Hủy khóa học"),
      value: "huy",
    ));
  }

  static void loadData() {
    listGt = [];
    listvtcv = [];
    listdvct = [];
    listttlv = [];

    listGt.add(DropdownMenuItem(
      child: Text("Nam"),
      value: "Nam",
    ));
    listGt.add(DropdownMenuItem(
      child: Text("Nữ"),
      value: "Nữ",
    ));

//list dropmenu vị trí công việc
    listvtcv.add(DropdownMenuItem(
      child: Text("Quản lý cao cấp"),
      value: "Quản lý cao cấp",
    ));
    listvtcv.add(DropdownMenuItem(
      child: Text("Quản lý nhân viên"),
      value: "Quản lý nhân viên",
    ));

//list dropmenu đơn vị công tác
    listdvct.add(DropdownMenuItem(
      child: Text("Phòng kinh doanh"),
      value: "Phòng kinh doanh",
    ));
    listdvct.add(DropdownMenuItem(
      child: Text("Phòng nhân sự"),
      value: "Phòng nhân sự",
    ));

    //list dropmenu trạng thái làm việc
    listttlv.add(DropdownMenuItem(
      child: Text("Đang làm việc"),
      value: "Đang làm việc",
    ));
    listttlv.add(DropdownMenuItem(
      child: Text("Đang nghỉ"),
      value: "Đang nghỉ",
    ));
  }
}

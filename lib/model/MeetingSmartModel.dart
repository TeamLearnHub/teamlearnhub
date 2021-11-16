import 'package:LearnHub/page/test.dart';

class MeetingSmartModelResponse {
  List<MeetingSmartModel> data;
  int statusCode;

  MeetingSmartModelResponse({this.data, this.statusCode});

  MeetingSmartModelResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<MeetingSmartModel>();
      json['data'].forEach((v) {
        data.add(new MeetingSmartModel.fromJson(v));
      });
    }
    statusCode = json["statusCode"];
  }
}

class MeetingSmartModel {
  String content;
  String dateFrom;
  String dateTo;
  String id;
  int status;
  String note;

  List<ThanhPhanThamGia> thanhPhanThamGia;

  MeetingSmartModel(
      {this.content,
      this.dateFrom,
      this.dateTo,
      this.id,
      this.status,
      this.note,
      this.thanhPhanThamGia});

  MeetingSmartModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    dateFrom = json['dateFrom'];
    dateTo = json['dateTo'];
    id = json['id'];
    status = json['status'];
    note = json['note'];
    if (json['thanhPhanThamGia'] != null) {
      thanhPhanThamGia = new List<ThanhPhanThamGia>();
      json['thanhPhanThamGia'].forEach((v) {
        thanhPhanThamGia.add(new ThanhPhanThamGia.fromJson(v));
      });
    }
  }
}

class ThanhPhanThamGia {
  String tenDonVi;
  String hoTen;
  CanBo canBo;
  String confirmDate;
  DonVi donVi;
  String id;
  int inviteRole;
  String reason;
  int status;
  String taskContent;
  String chucVu;
  String donViId;
  String canBoId;

  ThanhPhanThamGia(
      {this.tenDonVi,
      this.hoTen,
      this.canBo,
      this.confirmDate,
      this.donVi,
      this.id,
      this.inviteRole,
      this.reason,
      this.status,
      this.taskContent,
      this.chucVu,
      this.donViId,
      this.canBoId});

  ThanhPhanThamGia.fromJson(Map<String, dynamic> json) {
    tenDonVi = json['tenDonVi'];
    hoTen = json['hoTen'];
    canBo = json['canBo'] != null ? new CanBo.fromJson(json['canBo']) : null;
    confirmDate = json['confirmDate'];
    donVi = json['donVi'] != null ? new DonVi.fromJson(json['donVi']) : null;
    id = json['id'];
    inviteRole = json['inviteRole'];
    reason = json['reason'];
    status = json['status'];
    taskContent = json['taskContent'];
    chucVu = json['chucVu'];
    donViId = json['donViId'];
  }
}

class CanBo {
  String tenDonVi;
  String hoTen;
  String confirmDate;
  String id;
  int inviteRole;
  String reason;
  int status;
  String taskContent;
  String chucVu;
  String canBoId;

  CanBo(
      {this.tenDonVi,
      this.hoTen,
      this.confirmDate,
      this.id,
      this.inviteRole,
      this.reason,
      this.status,
      this.taskContent,
      this.chucVu,
      this.canBoId});

  CanBo.fromJson(Map<String, dynamic> json) {
    tenDonVi = json['tenDonVi'];
    hoTen = json['hoTen'];
    confirmDate = json['confirmDate'];
    id = json['id'];
    inviteRole = json['inviteRole'];
    reason = json['reason'];
    status = json['status'];
    taskContent = json['taskContent'];
    chucVu = json['chucVu'];
    canBoId = json['canBoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenDonVi'] = this.tenDonVi;
    data['hoTen'] = this.hoTen;
    data['confirmDate'] = this.confirmDate;
    data['id'] = this.id;
    data['inviteRole'] = this.inviteRole;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['taskContent'] = this.taskContent;
    data['chucVu'] = this.chucVu;
    data['canBoId'] = this.canBoId;
    return data;
  }
}

class DonVi {
  String tenDonVi;
  String id;

  int inviteRole;
  int status;
  String taskContent;

  DonVi(
      {this.tenDonVi, this.id, this.inviteRole, this.status, this.taskContent});

  DonVi.fromJson(Map<String, dynamic> json) {
    tenDonVi = json['tenDonVi'];
    id = json['id'];
    inviteRole = json['inviteRole'];
    status = json['status'];
    taskContent = json['taskContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenDonVi'] = this.tenDonVi;
    data['id'] = this.id;
    data['inviteRole'] = this.inviteRole;
    data['status'] = this.status;
    data['taskContent'] = this.taskContent;
    return data;
  }
}

import 'package:flutter/material.dart';

class UserLoginResponse {
  bool isError;
  int statusCode;
  String message;
  UserInformation result;
  int lastPage;
  int currentPage;

  UserLoginResponse(
      {this.isError,
      this.statusCode,
      this.message,
      this.result,
      this.lastPage,
      this.currentPage});

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      isError: json["isError"],
      statusCode: json["statusCode"],
      message: json["message"],
      result: json['result'] != null
          ? new UserInformation.fromJson(json['result'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isError'] = this.isError;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['last_page'] = this.lastPage;
    data['current_page'] = this.currentPage;
    return data;
  }
}

class UserInformation {
  String accessToken;
  int expiresIn;
  String message;
  String userName;
  String displayName;
  String userid;
  String employeeId;
  String tenantId;
  String tenantName;
  String tenantType;
  String avatar;
  bool isVerified;

  UserInformation(
      {this.accessToken,
      this.expiresIn,
      this.message,
      this.userName,
      this.displayName,
      this.userid,
      this.employeeId,
      this.tenantId,
      this.tenantName,
      this.tenantType,
      this.avatar,
      this.isVerified});

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    // ignore: missing_return
    return UserInformation(
        accessToken: json["access_token"],
        expiresIn: json["expires_in"],
        userName: json["userName"],
        message: json["message"],
        displayName: json["displayName"],
        userid: json["userid"],
        employeeId: json["employeeId"],
        tenantId: json["tenantId"],
        tenantName: json["tenantName"],
        tenantType: json["tenantType"],
        avatar: json["avatar"],
        isVerified: json["isVerified"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['message'] = this.message;
    data['userName'] = this.userName;
    data['displayName'] = this.displayName;
    data['userid'] = this.userid;
    data['employeeId'] = this.employeeId;
    data['tenantId'] = this.tenantId;
    data['tenantName'] = this.tenantName;
    data['tenantType'] = this.tenantType;
    data['avatar'] = this.avatar;
    data['isVerified'] = this.isVerified;
    return data;
  }
}

//request api
class UserBodyLogin {
  String userName;
  String password;

  UserBodyLogin(this.userName, this.password);

  Map<String, dynamic> toDatabaseJson() =>
      {"userName": this.userName, "password": this.password};
}

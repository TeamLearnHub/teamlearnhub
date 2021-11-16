class CourseClassResponse {
  bool isError;
  int statusCode;
  String message;
  List<CourseClassModel> result;

  CourseClassResponse(
      {this.isError, this.statusCode, this.message, this.result});

  CourseClassResponse.fromJson(Map<String, dynamic> json) {
    isError = json['isError'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['result'] != null) {
      result = new List<CourseClassModel>();
      json['result'].forEach((v) {
        result.add(new CourseClassModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isError'] = this.isError;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseClassModel {
  bool isAllowedRelearn;
  bool isAllowRegister;
  bool isApproved;
  AttendenceType attendenceType;
  TrainingMeThod trainingMeThod;
  String finalRegisteredDate;
  String fishedDateLimitation;
  int expectedCompletionTime;
  int numberOfRegisteredStudentsLimitation;
  int orders;
  List<Student> student;
  Student course;
  String avatarUrl;
  String code;
  String wallpaperUrl;
  String sId;
  String name;
  String description;

  CourseClassModel(
      {this.isAllowedRelearn,
      this.isAllowRegister,
      this.isApproved,
      this.attendenceType,
      this.trainingMeThod,
      this.finalRegisteredDate,
      this.fishedDateLimitation,
      this.expectedCompletionTime,
      this.numberOfRegisteredStudentsLimitation,
      this.orders,
      this.student,
      this.course,
      this.avatarUrl,
      this.code,
      this.wallpaperUrl,
      this.sId,
      this.name,
      this.description});

  factory CourseClassModel.fromJson(Map<String, dynamic> json) {
    return CourseClassModel(
        isAllowedRelearn: json['isAllowedRelearn'],
        isAllowRegister: json['isAllowRegister'],
        isApproved: json['isApproved'],
        attendenceType: json['attendenceType'] != null
            ? new AttendenceType.fromJson(json['attendenceType'])
            : null,
        trainingMeThod: json['trainingMeThod'] != null
            ? new TrainingMeThod.fromJson(json['trainingMeThod'])
            : null,
        finalRegisteredDate: json['finalRegisteredDate'],
        fishedDateLimitation: json['fishedDateLimitation'],
        expectedCompletionTime: json['expectedCompletionTime'],
        numberOfRegisteredStudentsLimitation:
            json['numberOfRegisteredStudentsLimitation'],
        course: json['course'] != null
            ? new Student.fromJson(json['course'])
            : null,
        avatarUrl: json['avatarUrl'],
        code: json['code'],
        wallpaperUrl: json['wallpaperUrl'],
        sId: json['_id'],
        name: json['name'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAllowedRelearn'] = this.isAllowedRelearn;
    data['isAllowRegister'] = this.isAllowRegister;
    data['isApproved'] = this.isApproved;
    if (this.attendenceType != null) {
      data['attendenceType'] = this.attendenceType.toJson();
    }
    if (this.trainingMeThod != null) {
      data['trainingMeThod'] = this.trainingMeThod.toJson();
    }
    data['finalRegisteredDate'] = this.finalRegisteredDate;
    data['fishedDateLimitation'] = this.fishedDateLimitation;
    data['expectedCompletionTime'] = this.expectedCompletionTime;
    data['numberOfRegisteredStudentsLimitation'] =
        this.numberOfRegisteredStudentsLimitation;
    data['orders'] = this.orders;
    if (this.student != null) {
      data['student'] = this.student.map((v) => v.toJson()).toList();
    }

    if (this.course != null) {
      data['course'] = this.course.toJson();
    }
    data['avatarUrl'] = this.avatarUrl;
    data['code'] = this.code;
    data['wallpaperUrl'] = this.wallpaperUrl;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class AttendenceType {
  String id;
  String name;
  int usedState;

  AttendenceType({this.id, this.name, this.usedState});

  factory AttendenceType.fromJson(Map<String, dynamic> json) {
    return AttendenceType(
        id: json['id'], name: json['name'], usedState: json['usedState']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['usedState'] = this.usedState;
    return data;
  }
}

class TrainingMeThod {
  String description;
  int usedState;
  int orders;
  String sId;
  String name;

  TrainingMeThod(
      {this.description, this.usedState, this.orders, this.sId, this.name});

  factory TrainingMeThod.fromJson(Map<String, dynamic> json) {
    return TrainingMeThod(
        description: json['description'],
        usedState: json['usedState'],
        orders: json['orders'],
        sId: json['_id'],
        name: json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['usedState'] = this.usedState;
    data['orders'] = this.orders;
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class Student {
  String sId;
  String name;
  String description;

  Student({this.sId, this.name, this.description});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        sId: json['_id'], name: json['name'], description: json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

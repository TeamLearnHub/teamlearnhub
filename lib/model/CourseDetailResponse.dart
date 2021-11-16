class CourseDetailResponse {
  bool isError;
  int statusCode;
  CourseDetailModel result;

  CourseDetailResponse({this.isError, this.statusCode, this.result});

  CourseDetailResponse.fromJson(Map<String, dynamic> json) {
    isError = json['isError'];
    statusCode = json['statusCode'];
    result = json['result'] != null
        ? new CourseDetailModel.fromJson(json['result'][0])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isError'] = this.isError;
    data['statusCode'] = this.statusCode;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class CourseDetailModel {
  // CourseCategory courseCategory;
  // List<CourseCategory> classes;
  // CourseCategory level;
  String registerDate;
  String registerCode;
  String startDate;
  String endDate;
  int expectedDuration;
  int courseDuration;
  String price;
  String currency;

  // CourseCategory paymentMethod;
  String version;
  String keyWords;
  String avatarUrl;
  String wallpaper;
  String language;
  int usedState;
  int orders;
  String sId;
  String name;
  String description;

  CourseDetailModel(
      {this.registerDate,
      this.registerCode,
      this.startDate,
      this.endDate,
      this.expectedDuration,
      this.courseDuration,
      this.price,
      this.currency,
      this.version,
      this.keyWords,
      this.avatarUrl,
      this.wallpaper,
      this.language,
      this.usedState,
      this.orders,
      this.sId,
      this.name,
      this.description});

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) {
    return CourseDetailModel(
        registerDate: json['registerDate'],
        registerCode: json['registerCode'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        expectedDuration: json['expectedDuration'],
        courseDuration: json['courseDuration'],
        price: json['price'],
        currency: json['currency'],
        version: json['version'],
        keyWords: json['keyWords'],
        avatarUrl: json['avatarUrl'],
        language: json['language'],
        usedState: json['usedState'],
        orders: json['orders'],
        sId: json['_id'],
        name: json['name'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.courseCategory != null) {
    //   data['courseCategory'] = this.courseCategory.toJson();
    // }
    // if (this.classes != null) {
    //   data['classes'] = this.classes.map((v) => v.toJson()).toList();
    // }
    // if (this.level != null) {
    //   data['level'] = this.level.toJson();
    // }
    data['registerDate'] = this.registerDate;
    data['registerCode'] = this.registerCode;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['expectedDuration'] = this.expectedDuration;
    data['courseDuration'] = this.courseDuration;
    data['price'] = this.price;
    data['currency'] = this.currency;
    // if (this.paymentMethod != null) {
    //   data['paymentMethod'] = this.paymentMethod.toJson();
    // }
    data['version'] = this.version;
    data['keyWords'] = this.keyWords;
    data['avatarUrl'] = this.avatarUrl;
    data['wallpaper'] = this.wallpaper;
    data['language'] = this.language;
    data['usedState'] = this.usedState;
    data['orders'] = this.orders;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class CourseCategory {
  String sId;
  String name;
  String description;

  CourseCategory({this.sId, this.name, this.description});

  factory CourseCategory.fromJson(Map<String, dynamic> json) {
    return CourseCategory(
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

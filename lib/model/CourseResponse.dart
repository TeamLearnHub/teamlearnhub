class CourseResponse {
  bool isError;
  int statusCode;
  String message;
  List<CourseListModel> result;
  Pagination pagination;

  CourseResponse(
      {this.isError,
      this.statusCode,
      this.message,
      this.result,
      this.pagination});

  CourseResponse.fromJson(Map<String, dynamic> json) {
    isError = json['isError'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['result'] != null) {
      result = new List<CourseListModel>();
      json['result'].forEach((v) {
        result.add(new CourseListModel.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isError'] = this.isError;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }

    return data;
  }
}

class CourseListModel {
  int courseDuration;
  int expectedDuration;

  // CourseCategoryList courseCategory;
  // CourseCategoryList level;
  // CourseCategoryList paymentMethod;
  String startDate;
  String endDate;
  String price;
  String currency;
  String avatarUrl;
  String language;
  String registerCode;
  String wallpaper;
  String sId;
  String name;
  String description;

  CourseListModel(
      {this.courseDuration,
      this.expectedDuration,
      // this.courseCategory,
      // this.level,
      // this.paymentMethod,
      this.startDate,
      this.endDate,
      this.price,
      this.currency,
      this.avatarUrl,
      this.language,
      this.registerCode,
      this.wallpaper,
      this.sId,
      this.name,
      this.description});

  factory CourseListModel.fromJson(Map<String, dynamic> json) {
    return CourseListModel(
        courseDuration: json['courseDuration'],
        expectedDuration: json['expectedDuration'],
        // courseCategory: json['courseCategory'] != null
        //     ? new CourseCategoryList.fromJson(json['courseCategory'])
        //     : null,
        // level: json['level'] != null
        //     ? new CourseCategoryList.fromJson(json['level'])
        //     : null,
        // paymentMethod: json['paymentMethod'] != null
        //     ? new CourseCategoryList.fromJson(json['paymentMethod'])
        //     : null,
        startDate: json['startDate'],
        endDate: json['endDate'],
        price: json['price'],
        currency: json['currency'],
        avatarUrl: json['avatarUrl'],
        language: json['language'],
        registerCode: json['registerCode'],
        wallpaper: json['wallpaper'],
        sId: json['_id'],
        name: json['name'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseDuration'] = this.courseDuration;
    data['expectedDuration'] = this.expectedDuration;
    // if (this.courseCategory != null) {
    //   data['courseCategory'] = this.courseCategory.toJson();
    // }
    // if (this.level != null) {
    //   data['level'] = this.level.toJson();
    // }
    // if (this.paymentMethod != null) {
    //   data['paymentMethod'] = this.paymentMethod.toJson();
    // }
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['avatarUrl'] = this.avatarUrl;
    data['language'] = this.language;
    data['registerCode'] = this.registerCode;
    data['wallpaper'] = this.wallpaper;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class CourseCategoryList {
  String sId;
  String name;
  String description;

  CourseCategoryList({this.sId, this.name, this.description});

  factory CourseCategoryList.fromJson(Map<String, dynamic> json) {
    return CourseCategoryList(
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

class Pagination {
  int totalItemsCount;
  int pageSize;
  int currentPage;
  int totalPages;

  Pagination(
      {this.totalItemsCount, this.pageSize, this.currentPage, this.totalPages});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
        totalItemsCount: json['totalItemsCount'],
        pageSize: json['pageSize'],
        currentPage: json['currentPage'],
        totalPages: json['totalPages']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalItemsCount'] = this.totalItemsCount;
    data['pageSize'] = this.pageSize;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

//request api
class CourseBody {
  String currentPage;
  String pageSize;

  CourseBody(this.currentPage, this.pageSize);

  Map<String, dynamic> toDatabaseJson() =>
      {"currentPage": this.currentPage, "pageSize": this.pageSize};
}

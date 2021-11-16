class CourseCategoryResponse {
  bool isError;
  int statusCode;
  String message;
  List<CourseCategory> result;

  CourseCategoryResponse(
      {this.isError, this.statusCode, this.message, this.result});

  CourseCategoryResponse.fromJson(Map<String, dynamic> json) {
    isError = json['isError'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['result'] != null) {
      result = new List<CourseCategory>();
      json['result'].forEach((v) {
        result.add(new CourseCategory.fromJson(v));
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

class CourseCategory {
  String avatarUrl;
  String wallpaperUrl;
  int usedState;
  int orders;
  String sId;
  String name;
  String description;

  CourseCategory(
      {this.avatarUrl,
      this.wallpaperUrl,
      this.usedState,
      this.orders,
      this.sId,
      this.name,
      this.description});

  factory CourseCategory.fromJson(Map<String, dynamic> json) {
    return CourseCategory(
        avatarUrl: json['avatarUrl'],
        wallpaperUrl: json['wallpaperUrl'],
        usedState: json['usedState'],
        orders: json['orders'],
        sId: json['_id'],
        name: json['name'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarUrl'] = this.avatarUrl;
    data['wallpaperUrl'] = this.wallpaperUrl;
    data['usedState'] = this.usedState;
    data['orders'] = this.orders;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

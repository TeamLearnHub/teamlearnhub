class ClassesModelResponse {
  final String name;
  final String description;
  final String thumbnail;

  ClassesModelResponse({this.name, this.description, this.thumbnail});

  factory ClassesModelResponse.fromJson(Map<String, dynamic> json) {
    return ClassesModelResponse(
        name: json['name'],
        description: json['description'],
        thumbnail: json['thumbnail']);
  }
}

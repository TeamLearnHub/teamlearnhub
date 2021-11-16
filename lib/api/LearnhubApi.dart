import 'dart:convert';

import 'package:LearnHub/page/test.dart';
import 'package:http/http.dart' as http;

class LearnHubApi {
  Future<List<Data>> fetchData() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/albums');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => new Data.fromJson(data))
          .toList()
          .sublist(0, 4);
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}

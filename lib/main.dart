import 'package:LearnHub/page/home/home_tab_view.dart';
import 'package:LearnHub/page/login/login_view.dart';
import 'package:LearnHub/page/mycource/my_cource_detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'LearnHub',
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => LoginPage(),
      '/home': (context) => HomeTabPage(),
      '/cource_detail': (context) => MyCourseDetailPage(),
    },
  ));
}

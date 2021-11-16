import 'package:LearnHub/page/account/my_account.dart';
import 'package:LearnHub/page/home/home_view.dart';
import 'package:LearnHub/page/mycource/my_cource.dart';
import 'package:LearnHub/page/setting/setting_view.dart';
import 'package:LearnHub/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeTabState();
  }
}

class HomeTabState extends State<HomeTabPage> {
  int _currentIndex = 0;
  final tabs = [HomePage(), MyCourcePage(), MyCourcePage(), MyAccountPage(),SettingPage()];

  @override
  Widget build(BuildContext context) {
    var ic_home = new Image(
        image: AssetImage('assets/ic_home.png'), height: 35, width: 50);
    var ic_setting = new Image(
        image: AssetImage('assets/ic_setting.png'), height: 35, width: 50);
    var ic_course = new Image(
        image: AssetImage('assets/ic_course.png'), height: 35, width: 50);
    var ic_account = new Image(
        image: AssetImage('assets/ic_account.png'), height: 35, width: 50);
    var ic_search = new Image(
        image: AssetImage('assets/ic_search.png'), height: 35, width: 50);

    // TODO: implement build
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
      
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: ic_home,
              title: Text(
                'Trang chủ',
                style: TextStyle(
                    color: HexColor.fromHex("#AA3234"), fontWeight: FontWeight.bold),
              ),
              backgroundColor: HexColor.fromHex("#FFFFFF")),
          BottomNavigationBarItem(
              icon: ic_search,
              title: Text(
                'Tìm kiếm',
                style: TextStyle(
                    color: HexColor.fromHex("#AA3234"), fontWeight: FontWeight.bold),
              ),
              backgroundColor: HexColor.fromHex("#FFFFFF")),
          BottomNavigationBarItem(
              icon: ic_course,
              title: Text(
                'Khoá học của tôi',
                style: TextStyle(
                    color: HexColor.fromHex("#AA3234"), fontWeight: FontWeight.bold),
              ),
              backgroundColor: HexColor.fromHex("#FFFFFF")),
          BottomNavigationBarItem(
              icon: ic_account,
              title: Text(
                'Tài khoản',
                style: TextStyle(
                    color: HexColor.fromHex("#AA3234"), fontWeight: FontWeight.bold),
              ),
              backgroundColor: HexColor.fromHex("#FFFFFF")),
          BottomNavigationBarItem(
              icon: ic_setting,
              title: Text(
                'Cài đặt',
                style: TextStyle(
                    color: HexColor.fromHex("#AA3234"), fontWeight: FontWeight.bold),
              ),
              backgroundColor: HexColor.fromHex("#FFFFFF"))
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

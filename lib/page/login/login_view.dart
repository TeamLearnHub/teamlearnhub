import 'dart:convert';
import 'package:LearnHub/model/UserModel.dart';
import 'package:LearnHub/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final userName = TextEditingController();
  final passWord = TextEditingController();
  UserBodyLogin userBodyLogin;

  @override
  void dispose() {
    // TODO: implement dispose
    userName.dispose();
    passWord.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadToken();
  }

  String urlLogin = "http://118.70.236.144:8080/api/v1.0/Account/Login";
  String urlSchedule = "http://a-dev.chinhquyendientu.vn/api/Schedules/getall";
  String accessToken;

  _loadToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      accessToken = (sharedPreferences.getString(Utils.key_token) ?? "");
    });
  }

  _saveToken(String accessToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setString(Utils.key_token, accessToken);
    });
  }

  Future<UserLoginResponse> login(UserBodyLogin userBodyLogin) async {
    final http.Response response = await http.post(urlLogin,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userBodyLogin.toDatabaseJson()));

    if (response.statusCode == 200) {
      print((json.decode(response.body)).toString());
      Map result = json.decode(response.body);
      UserLoginResponse userLoginResponse = UserLoginResponse.fromJson(result);
      print("token = " + userLoginResponse.result.accessToken);
      print("message = " + userLoginResponse.result.message);

      if (Utils.equalsIgnoreCase(
          userLoginResponse?.message, "Đăng nhập thành công!")) {
        _saveToken(userLoginResponse.result?.accessToken);
        Navigator.pushNamed(context, '/home');
      } else {
        Fluttertoast.showToast(
            msg: "Sai tài khoản!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }

      return userLoginResponse;
    }
  }

  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/ic_logo.png');
    var image = new Image(image: assetsImage, width: 200.0, height: 120.0);
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 90.0),
                  Align(alignment: Alignment.center, child: image),
                  Text('Grow Your People',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: HexColor.fromHex('#F5F6F9'),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: userName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tên đăng nhập',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    margin: EdgeInsets.only(top: 32),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: HexColor.fromHex('#F5F6F9'),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: passWord,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  InkWell(
                    onTap: () {
                      setState(() {
                        login(new UserBodyLogin(userName.text.toString(),
                            passWord.text.toString()));
                      });
                    },
                    child: new Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              HexColor.fromHex('#FAA244'),
                              HexColor.fromHex('#FF8400')
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                        child: Text(
                          'Đăng nhập'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Quên mật khẩu ?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

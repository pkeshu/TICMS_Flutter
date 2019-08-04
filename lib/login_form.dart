import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './Dashboard/main_dashboard.dart';
import './model/loginResponse/login_response_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Util/logout_user_nav_menu.dart';
import './Util/toast_show.dart';

class LoginForm extends StatefulWidget {
  LoginForm();
  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  String _token = "";
  Future _checkLogin() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = preference.getString("token") ?? "";
    if (_token.isNotEmpty) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => MainDashboard()));
    }
  }

  final _usernameController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "");
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextStyle _style = TextStyle(fontSize: 16.0, color: Colors.black);

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    final _usernameTextFiels = TextField(
      controller: _usernameController,
      obscureText: false,
      style: _style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Username",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
    final _passwordTextFiels = TextField(
      controller: _passwordController,
      obscureText: true,
      style: _style,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final _loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffea0a89),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _userLogin(
              _usernameController.text.trim(), _passwordController.text.trim());
        },
        child: Text("LOG IN",
            textAlign: TextAlign.center,
            style: _style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color(0xFF2C387B),
      ),
      drawer: LogoutUserNavMenu(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 310.0),
            _usernameTextFiels,
            SizedBox(
              height: 16.0,
            ),
            _passwordTextFiels,
            SizedBox(
              height: 32.0,
            ),
            _loginButon,
            SizedBox(
              height: 8.0,
            ),
            Text(
              "No Access? Call Admin!",
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Future<String> _userLogin(String username, String password) async {
    final String loginUrl = "https://devapp.texasintl.edu.np/";
    final String preFix = "auth/api/v1/";
    var body = json.encode({
      "client": "",
      "deviceId": "",
      "username": username,
      "password": password
    });
    var headers = {
      "content-type": "application/json",
      "domain": "texasintl.edu.np"
    };
    return await http
        .post(Uri.encodeFull(loginUrl + preFix + "login"),
            body: body, headers: headers)
        .then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode == 200) {
        var userDetail = json.decode(response.body)["user"];
        print(userDetail['team'].toString());
        LoginResponse loginResponse = new LoginResponse(
          firstName: userDetail["firstName"],
          lastName: userDetail["lastName"],
          courseId: userDetail["courseId"],
          token: userDetail["token"],
          customerId: userDetail["customerId"],
          loginId: userDetail["loginId"],
          loginType: userDetail["loginType"],
          status: userDetail["status"],
          deviceId: userDetail["deviceId"],
          courseName: userDetail["courseName"],
          username: userDetail["username"],
          name: userDetail["name"],
          middleName: userDetail["middleName"],
          email: userDetail["email"],
          gender: userDetail["gender"],
          phoneNumber: userDetail["phoneNumber"],
          mobileNumber: userDetail["mobileNumber"],
          userRole: userDetail["userRole"],
          id: userDetail["id"],
          profilePicture: userDetail["profilePicture"],
        );
        saveUserDetailInSharedPref(loginResponse);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainDashboard(
                      loginResponse: loginResponse,
                    )));
                    ToastShow(message: "successfully Login").showSuccessToast();
      } else {
        ToastShow(message: json.decode(response.body)["message"].toString()).showErrorToast();
        throw json.decode(response.body)["message"];
      }
    });
  }

  void saveUserDetailInSharedPref(LoginResponse loginResponse) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString("firstName", loginResponse.firstName);
    preferences.setString("lastName", loginResponse.lastName);
    preferences.setString("courseName", loginResponse.courseName);
    preferences.setString("courseId", loginResponse.courseId);
    preferences.setInt("customerId", loginResponse.customerId);
    preferences.setInt("loginId", loginResponse.loginId);
    preferences.setInt("id", loginResponse.id);
    preferences.setString("deviceId", loginResponse.deviceId);
    preferences.setString("token", loginResponse.token);
    preferences.setString("email", loginResponse.email);
    preferences.setString("gender", loginResponse.gender);
    preferences.setString("loginType", loginResponse.loginType);
    preferences.setString("middleName", loginResponse.middleName);
    preferences.setString("phoneNumber", loginResponse.phoneNumber);
    preferences.setString("mobileNumber", loginResponse.mobileNumber);
    preferences.setString("status", loginResponse.status);
    preferences.setString("profilePicture", loginResponse.profilePicture);
    preferences.setString("userRole", loginResponse.userRole);
    preferences.setString("username", loginResponse.username);
    preferences.setString("name", loginResponse.name);
    // if (loginResponse.team.isEmpty) {
    //   preferences.setStringList("teamNameList", teamNameList);
    // } else {
    //   for (Team t in loginResponse.team) {
    //     teamNameList.add(t.name);
    //   }
    //   preferences.setStringList("teamNameList", teamNameList);
    // }
  }
}

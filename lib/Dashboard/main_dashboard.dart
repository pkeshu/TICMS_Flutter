import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './DashboardDesign/circular_image_for_dashboard.dart';
import '../model/loginResponse/login_response_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Util/login_user_nav_menu.dart';
import '../Util/toast_show.dart';

class MainDashboard extends StatefulWidget {
  final LoginResponse loginResponse;
  MainDashboard({this.loginResponse});

  @override
  _MainDashboard createState() => _MainDashboard(loginResponse: loginResponse);
}

class _MainDashboard extends State<MainDashboard> {
  final LoginResponse loginResponse;
  _MainDashboard({this.loginResponse});
  String _firstName = '';
  String _lastName = '';
  String _profilePicture = '';

  @override
  void initState() {
    _updateValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _userPP = GestureDetector(
      child: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(2.0),
        width: 32.0,
        height: 32.0,
        decoration: new BoxDecoration(
          color: const Color(0xff7c94b6),
          image: new DecorationImage(
            image: NetworkImage(_profilePicture),
            fit: BoxFit.cover,
          ),
          borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
        ),
      ),
      onTap: () {
        ToastShow(message: "Goto user details page").showSuccessToast();
      },
    );
    final _userNoPP = GestureDetector(
        child: Container(
          width: 36.0,
          height: 36.0,
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 8.0),
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundColor:
                Theme.of(context).platform == TargetPlatform.android
                    ? Colors.white
                    : null,
            child: Text(
              _firstName.substring(0, 1).toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF2C387B)),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
          ),
        ),
        onTap: () {
          ToastShow(message: "Goto user details page").showSuccessToast();
        });
    final _notification = GestureDetector(
      child: Container(
        width: 46.0,
        height: 46.0,
        alignment: Alignment.centerRight,
        child: Stack(
          children: <Widget>[
            ImageIcon(AssetImage("assets/icons/notification.png")),
            Positioned(
              // bottom: 8.0,
              // left: 8.0,
              // right: 8.0,
              // top: 8.0,
              child: Container(
                height: 26.0,
                width: 26.0,
                margin: EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.android
                          ? Colors.white
                          : null,
                  child: Text(
                    "0",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(50.0)),
                    border: Border.all(color: Color(0xFF2C387B), width: 2.0)),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        ToastShow(message: "Goto Notification List").showSuccessToast();
      },
    );
    _checkProfilePicture() {
      if (_profilePicture == "")
        return _userNoPP;
      else
        return _userPP;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          backgroundColor: Color(0xFF2C387B),
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
          actions: <Widget>[_notification, _checkProfilePicture()],
        ),
        drawer: LoginUserNavMenu(),
        body: Container(
          margin: EdgeInsets.only(top: 16.0, left: 16.0),
          padding: EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  child: CircularImageforDashboard("assets/users.jpg", "Users"),
                ),
                SizedBox(
                  width: 34.0,
                ),
                GestureDetector(
                  child: CircularImageforDashboard(
                      "assets/studying.jpg", "Students"),
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Student Section"),
                    ));
                  },
                ),
                SizedBox(
                  width: 34.0,
                ),
                GestureDetector(
                  child: CircularImageforDashboard(
                      "assets/teacher.jpg", "Teachers"),
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Teacher section"),
                    ));
                  },
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 36.0,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  child: CircularImageforDashboard(
                      "assets/routine.png", "Routine"),
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Routine section"),
                    ));
                    print("Routine is here");
                  },
                ),
                SizedBox(
                  width: 34.0,
                ),
                GestureDetector(
                  child:
                      CircularImageforDashboard("assets/course.jpg", "Course"),
                  onTap: () {
                    print("hello course");
                  },
                ),
                SizedBox(
                  width: 34.0,
                ),
                GestureDetector(
                  child: CircularImageforDashboard(
                      "assets/subjects.jpg", "Subject"),
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Subject section"),
                    ));
                  },
                )
              ],
            ),
          ]),
        ));
  }

  void _updateValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _firstName = preferences.getString("firstName") ?? "";
      _lastName = preferences.getString("lastName") ?? "";
      _profilePicture = preferences.getString("profilePicture") ?? "";
    });
  }
}

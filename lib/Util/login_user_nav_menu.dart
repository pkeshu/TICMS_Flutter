import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticms/Util/toast_show.dart';

class LoginUserNavMenu extends StatefulWidget {
  @override
  _LoginUserNavMenu createState() => _LoginUserNavMenu();
}

class _LoginUserNavMenu extends State<LoginUserNavMenu> {
  String _firstname = '';
  String _lastname = '';
  String _email = '';
  String _profilePicture = '';
  _checkProfilePicture() {
    if (_profilePicture == "") {
      return GestureDetector(
        child: Column(
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              padding: EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.android
                        ? Colors.white
                        : null,
                child: Text(
                  _firstname.substring(0, 1).toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF2C387B)),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                border: new Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text("$_firstname $_lastname",
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "$_email",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            )
          ],
        ),
        onTap: () {
          ToastShow(message: "Goto your Profile").showErrorToast();
        },
      );
    } else {
      return GestureDetector(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 80.0,
              height: 80.0,
              decoration: new BoxDecoration(
                color: const Color(0xff7c94b6),
                image: new DecorationImage(
                  image: NetworkImage(_profilePicture),
                  fit: BoxFit.cover,
                ),
                borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                border: new Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text("$_firstname $_lastname",
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "$_email",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            )
          ],
        ),
        onTap: () {
          ToastShow(message: "Goto your Profile").showSuccessToast();
        },
      );
    }
  }

  @override
  void initState() {
    _updateStateValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      child: Drawer(
        elevation: 4.0,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF2C387B),
              ),
              child: _checkProfilePicture(),
            ),
            ListTile(
                title: Text("Home"),
                leading: ImageIcon(AssetImage("assets/icons/home.png")),
                onTap: () {
                  ToastShow(message: "Goto Home page").showSuccessToast();
                }),
            ListTile(
                title: Text("Dashboard"),
                leading: ImageIcon(AssetImage("assets/icons/dashboard.png")),
                onTap: () {
                  ToastShow(message: "Goto Dashboard page").showSuccessToast();
                }),
            ListTile(
                title: Text("Team"),
                leading: ImageIcon(AssetImage("assets/icons/team.png")),
                onTap: () {
                  ToastShow(message: "Goto Team page").showSuccessToast();
                }),
            ListTile(
                title: Text("Counseling"),
                leading: ImageIcon(AssetImage("assets/icons/counseling.png")),
                onTap: () {
                  ToastShow(message: "Goto Counseling page").showSuccessToast();
                }),
            ListTile(
                title: Text("Users"),
                leading: ImageIcon(AssetImage("assets/icons/users.png")),
                onTap: () {
                  ToastShow(message: "Goto User page").showSuccessToast();
                }),
            ListTile(
                title: Text("Courses"),
                leading: ImageIcon(AssetImage("assets/icons/course.png")),
                onTap: () {
                  ToastShow(message: "Goto Course page").showSuccessToast();
                }),
            ListTile(
                title: Text("Subjects"),
                leading: ImageIcon(AssetImage("assets/icons/subjects.png")),
                onTap: () {
                  ToastShow(message: "Goto Subject page").showSuccessToast();
                }),
            ListTile(
                title: Text("Teachers"),
                leading: ImageIcon(AssetImage("assets/icons/teacher.png")),
                onTap: () {
                  ToastShow(message: "Goto Teacher page").showSuccessToast();
                }),
            ListTile(
                title: Text("Students"),
                leading: ImageIcon(AssetImage("assets/icons/student.png")),
                onTap: () {
                  ToastShow(message: "Goto Student page").showSuccessToast();
                }),
            ListTile(
                title: Text("Class Routine"),
                leading: ImageIcon(AssetImage("assets/icons/routine.png")),
                onTap: () {
                  ToastShow(message: "Goto Routine page").showSuccessToast();
                }),
            ListTile(
                title: Text("Send Notification"),
                leading:
                    ImageIcon(AssetImage("assets/icons/send_notification.png")),
                onTap: () {
                  ToastShow(message: "Goto Send Notification page")
                      .showSuccessToast();
                }),
            ListTile(
                title: Text("Contact"),
                leading: ImageIcon(AssetImage("assets/icons/contact.png")),
                onTap: () {
                  ToastShow(message: "Goto Contact page").showSuccessToast();
                }),
            ListTile(
                title: Text("Logout"),
                leading: ImageIcon(AssetImage("assets/icons/logout.png")),
                onTap: () {
                  ToastShow(message: "Logout").showSuccessToast();
                }),
          ],
        ),
      ),
    );
  }

  void _updateStateValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _firstname = preferences.getString("firstName") ?? "";
      _lastname = preferences.getString("lastName") ?? "";
      _email = preferences.getString("email") ?? "";
      _profilePicture = preferences.getString("profilePicture") ?? "";
    });
  }
}

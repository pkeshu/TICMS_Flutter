import 'package:flutter/material.dart';

class LogoutUserNavMenu extends StatefulWidget {
  @override
  _LogoutUserNavMenu createState() => _LogoutUserNavMenu();
}

class _LogoutUserNavMenu extends State<LogoutUserNavMenu> {
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
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: 100.0,
                      height: 100.0,
                      decoration: new BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: new DecorationImage(
                          image: AssetImage("assets/user.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(50.0)),
                        border: new Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("Please Login",
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  ],
                )),
            ListTile(
                title: Text("Home"),
                leading: ImageIcon(AssetImage("assets/icons/home.png")),
                onTap: () {}),
            ListTile(
                title: Text("Contact"),
                leading: ImageIcon(AssetImage("assets/icons/contact.png")),
                onTap: () {}),
            ListTile(
              title: Text("Login"),
              leading: ImageIcon(AssetImage("assets/icons/login.png")),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

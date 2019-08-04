import 'package:flutter/material.dart';
import 'package:ticms/User/users.dart';
import 'package:ticms/Util/toast_show.dart';

class CircularImageforDashboard extends StatelessWidget {
  final String imagePath;
  final String imageName;
  CircularImageforDashboard(this.imagePath, this.imageName);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        child: InkWell(
          onTap: () {
            if (imageName == "Users") {
              ToastShow(message: "Goto User List").showSuccessToast();
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context)=>Users()
              ));
            }

            if (imageName == "Students")
              ToastShow(message: "Goto Student List").showSuccessToast();
            if (imageName == "Teachers")
              ToastShow(message: "Goto Teacher List").showSuccessToast();
            if (imageName == "Routine")
              ToastShow(message: "Goto Routine ").showSuccessToast();
            if (imageName == "Course")
              ToastShow(message: "Goto Course ").showSuccessToast();
            if (imageName == "Subject")
              ToastShow(message: "Goto Subject ").showSuccessToast();
          },
        ),
        width: 80.0,
        height: 80.0,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF2C387B), width: 2.0),
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(imagePath))),
      ),
      SizedBox(
        height: 16.0,
      ),
      Text(
        imageName,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.0),
      )
    ]);
  }
}

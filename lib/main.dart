import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import './login_form.dart';

void main() => runApp(TICMS());

class TICMS extends StatelessWidget {
  get defaultTagetPlatform => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: defaultTagetPlatform == TargetPlatform.iOS
            ? Color(0xFF2C387B)
            : Color(0xFF2C387B),
      ),
      home: Scaffold(body: LoginForm()),
    );
  }
}

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastShow {
  final String message;
  ToastShow({this.message});
  showErrorToast() {
    Fluttertoast.showToast(
        msg: message,
        fontSize: 16.0,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white,
        backgroundColor: Color(0xffea0a89)
        // backgroundColor: Colors.red
        );
  }

  showSuccessToast() {
    Fluttertoast.showToast(
        msg: message,
        fontSize: 16.0,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white);
  }
}

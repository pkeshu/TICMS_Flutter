import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticms/Service/global_values.dart';
import 'package:ticms/Util/toast_show.dart';
import 'package:ticms/model/UserModel/user.dart';

import 'package:ticms/model/UserModel/user_response.dart';

class Users extends StatefulWidget {
  @override
  _Users createState() => _Users();
}

class _Users extends State<Users> {
  String _token = '';
  int _customerId = 0;
  int _loginId = 0;
  int _page = 0;
  String _search = '';
  int _size = 20;
  String _sort = 'firstName,asc';
  List data;

  Future<String> getUsers() async {
    var header = {
      "content-type": "application/json",
      "customerId": _customerId,
      "loginId": _loginId,
      "page": _page,
      "search": _search,
      "size": _size,
      "sort": _sort,
      "token": _token
    };

    final String baseUrl = "https://devapp.texasintl.edu.np/";
    final String preFix = "auth/api/v1/";

    // return await http
    //     .get(Uri.encodeFull(baseUrl + preFix + "users"), headers: header)
    //     .then((http.Response response) {
    //   print(response.body);
    // });
    var response = await http.get(Uri.encodeFull(baseUrl + preFix + "users"),
        headers: header);
    var data = json.decode(response.body)["data"];
    print(data[1]["firstName"]);
    // if (response.statusCode == 200) {
    //   List<UserResponse> userResponseList = [];

    //   for (var l in responseData["data"]) {
    //     UserResponse userResponse = UserResponse(firstName: l["firstName"]);
    //     userResponseList.add(userResponse);
    //   }
    //   User user =
    //       User(total: responseData["total"], userResponse: userResponseList);
    //   return user;
    // } else {
    //   ToastShow(message: json.decode(response.body)["message"].toString())
    //       .showErrorToast();
    //   throw json.decode(response.body)["message"];
    // }
    return "success";
  }

  @override
  void initState() {
    super.initState();
    _updateValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              getUsers();
            },
            child: Text("click"),
          ),
        ),
        // child: FutureBuilder(
        // future: _getUsers(),
        // builder: (BuildContext context, AsyncSnapshot snapshot) {
        //   return ListView.builder(
        //     itemBuilder: (BuildContext context, int index) {
        //       return ListTile(
        //         title: Text(snapshot.data[index].firstName),
        //       );
        //     },
        //     // itemCount: snapshot.data.length,
        //   );
        // },
        // ),
      ),
    );
  }

  void _updateValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      _customerId = preferences.getInt("customerId") ?? 0;
      _loginId = preferences.getInt("loginId") ?? 0;
      _token = preferences.getString("token") ?? "";
    });
  }
}

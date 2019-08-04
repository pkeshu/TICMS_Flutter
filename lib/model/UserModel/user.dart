import 'package:json_annotation/json_annotation.dart';
import 'package:ticms/model/UserModel/user_response.dart';

@JsonSerializable()
class User {
  final int total;
  final List userResponse;

  User({this.total, this.userResponse});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(total: parsedJson["total"], userResponse: parsedJson["data"]);
  }
}

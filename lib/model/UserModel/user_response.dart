import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserResponse {
  final String courseName;
  final String courseId;
  final int customerId;
  final String deviceId;
  final String email;
  final String firstName;
  final String gender;
  final int id;
  final String lastName;
  final int loginId;
  final String loginType;
  final String middleName;
  final String mobileNumber;
  final String name;
  final String phoneNumber;
  final String profilePicture;
  final String status;
  final String token;
  final String userRole;
  final String username;

  UserResponse({
    this.courseName,
    this.courseId,
    this.customerId,
    this.deviceId,
    this.email,
    this.firstName,
    this.gender,
    this.id,
    this.lastName,
    this.loginId,
    this.loginType,
    this.middleName,
    this.mobileNumber,
    this.name,
    this.phoneNumber,
    this.profilePicture,
    this.status,
    this.token,
    this.userRole,
    this.username,
  });

  factory UserResponse.fromJson(Map<String, dynamic> parsedJson) {
    return UserResponse(
        courseName: parsedJson['courseName'],
        courseId: parsedJson['courseId'],
        customerId: parsedJson['customerId'],
        deviceId: parsedJson['deviceId'],
        email: parsedJson['courseName'],
        firstName: parsedJson['firstName'],
        gender: parsedJson['gender'],
        id: parsedJson['id'],
        lastName: parsedJson['lastName'],
        loginId: parsedJson['loginId'],
        loginType: parsedJson['loginType'],
        middleName: parsedJson['middleName'],
        mobileNumber: parsedJson['mobileNumber'],
        name: parsedJson['name'],
        phoneNumber: parsedJson['phoneNumber'],
        profilePicture: parsedJson['profilePicture'],
        status: parsedJson['status'],
        token: parsedJson['token'],
        userRole: parsedJson['userRole'],
        username: parsedJson['username']);
  }
}

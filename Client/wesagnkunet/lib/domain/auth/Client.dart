


import 'package:wesagnkunet/domain/auth/user.dart';

class Client{

  int pk;
  User user;

  String firstName;
  String middleName;
  String lastName;

  String sex;
  DateTime dateOfBirth;

  String bloodType;
  String city;
  String country;
  String nationality;

  String phoneNumber;

  Client(
    this.pk,
    this.user,
    this.firstName,
    this.middleName,
    this.lastName,
    this.sex,
    this.dateOfBirth,
    this.bloodType,
    this.city,
    this.country,
    this.nationality,
    this.phoneNumber,
  );

}
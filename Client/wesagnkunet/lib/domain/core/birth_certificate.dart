import 'package:wesagnkunet/domain/core/certificate.dart';

class Child {
  String first_name;
  String middle_name;
  String last_name;

  Child(this.first_name, this.middle_name, this.last_name);
}

class ParentInformation {
  String first_name;
  String middle_name;
  String last_name;

  ParentInformation(this.first_name, this.middle_name, this.last_name);
}

class BirthCertificate {
  int id;
  Child child;
  ParentInformation father;
  ParentInformation mother;
  CertificateDetail detail;
  String gender;
  DateTime birthDate;
  bool verified;

  BirthCertificate(this.id, this.child, this.father, this.mother, this.detail,
      this.gender, this.birthDate, this.verified);
}

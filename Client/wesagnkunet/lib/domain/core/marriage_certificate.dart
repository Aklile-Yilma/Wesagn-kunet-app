


import 'package:wesagnkunet/domain/core/certificate.dart';

class Spouse{

  String firstName;
  String middleName;
  String lastName;

  Spouse(this.firstName, this.middleName, this.lastName);

}


class MarriageCertificate{

  int id;
  Spouse wife;
  Spouse husband;
  CertificateDetail detail;
  DateTime marriageDate;

  MarriageCertificate(
    this.id,
    this.wife,
    this.husband,
    this.detail,
    this.marriageDate
  );

}
import 'package:wesagnkunet/domain/core/certificate.dart';

class DeceasedInformation {
  String first_name;
  String middle_name;
  String last_name;

  DateTime date_of_birth;
  String title;

  String country;
  String nationality;
  String city;
  String subcity;
  String woreda;
  String house_number;
  DateTime date_of_death;

  DeceasedInformation(
      this.first_name,
      this.middle_name,
      this.last_name,
      this.date_of_birth,
      this.title,
      this.country,
      this.nationality,
      this.city,
      this.subcity,
      this.woreda,
      this.house_number,
      this.date_of_death);
}

class DeathCertificate {
  int id;
  DeceasedInformation deceasedInformation;
  CertificateDetail detail;
  bool verified;

  DeathCertificate(
      this.id, this.deceasedInformation, this.detail, this.verified);
}

import 'package:wesagnkunet/domain/core/birth_certificate.dart';
import 'package:wesagnkunet/domain/core/certificate.dart';
import 'package:wesagnkunet/domain/core/death_certificates.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/lib/network/Serializer.dart';

class MarriageCertificateDBSerializer extends Serializer<MarriageCertificate> {
  @override
  Map<String, dynamic> serialize(instance) {
    String? issueDate = null;
    if (instance.detail.issueDate != null) {
      issueDate = instance.detail.issueDate.toString();
    }

    return {
      "id": instance.id,
      "wife_first_name": instance.wife.firstName,
      "wife_middle_name": instance.wife.middleName,
      "wife_last_name": instance.wife.lastName,
      "husband_first_name": instance.husband.firstName,
      "husband_middle_name": instance.husband.middleName,
      "husband_last_name": instance.husband.lastName,
      "issue_date": issueDate,
      "application_date": instance.detail.applicationDate.toString()
    };
  }

  @override
  MarriageCertificate deSerialize(dynamic json) {
    return MarriageCertificate(
        json["id"],
        Spouse(json["wife_first_name"], json["wife_middle_name"],
            json["wife_last_name"]),
        Spouse(json["husband_first_name"], json["husband_middle_name"],
            json["husband_last_name"]),
        CertificateDetail([], DateTime.parse(json["issue_date"]),
            DateTime.parse(json["application_date"])),
        DateTime.parse(json["marriage_date"]),
        false);
  }
}

class BirthCertificateDBSerializer extends Serializer<BirthCertificate> {
  @override
  Map<String, dynamic> serialize(instance) {
    String? issueDate = null;
    if (instance.detail.issueDate != null) {
      issueDate = instance.detail.issueDate.toString();
    }

    return {
      "id": instance.id,
      "child_first_name": instance.child.first_name,
      "child_middle_name": instance.child.middle_name,
      "child_last_name": instance.child.last_name,
      "child_gender": instance.gender,
      "child_birth_date": instance.birthDate,
      "father_first_name": instance.father.first_name,
      "father_middle_name": instance.father.middle_name,
      "father_last_name": instance.father.last_name,
      "mother_first_name": instance.mother.first_name,
      "mother_middle_name": instance.mother.middle_name,
      "mother_last_name": instance.mother.last_name,
      "issue_date": issueDate,
      "application_date": instance.detail.applicationDate.toString()
    };
  }

  @override
  BirthCertificate deSerialize(dynamic json) {
    return BirthCertificate(
        json["id"],
        Child(json["child_first_name"], json["child_middle_name"],
            json["child_last_name"]),
        ParentInformation(
          json["father_first_name"],
          json["father_middle_name"],
          json["father_last_name"],
        ),
        ParentInformation(json["mother_first_name"], json["mother_middle_name"],
            json["mother_last_name"]),
        CertificateDetail([], DateTime.parse(json["issue_date"]),
            DateTime.parse(json["application_date"])),
        json["gender"],
        DateTime.parse(json["birth_date"]),
        false);
  }
}

class DeathCertificateDBSerializer extends Serializer<DeathCertificate> {
  @override
  Map<String, dynamic> serialize(instance) {
    String? issueDate = null;
    if (instance.detail.issueDate != null) {
      issueDate = instance.detail.issueDate.toString();
    }

    return {
      "id": instance.id,
      "deceased_first_name": instance.deceasedInformation.first_name,
      "deceased_middle_name": instance.deceasedInformation.middle_name,
      "deceased_last_name": instance.deceasedInformation.last_name,
      "title": instance.deceasedInformation.title,
      "country": instance.deceasedInformation.country,
      "nationality": instance.deceasedInformation.nationality,
      "city": instance.deceasedInformation.city,
      "subcity": instance.deceasedInformation.subcity,
      "woreda": instance.deceasedInformation.woreda,
      "house_number": instance.deceasedInformation.house_number,
      "date_of_death": instance.deceasedInformation.date_of_death,
      "issue_date": issueDate,
      "application_date": instance.detail.applicationDate.toString()
    };
  }

  @override
  DeathCertificate deSerialize(dynamic json) {
    return DeathCertificate(
        json["id"],
        DeceasedInformation(
          json["first_name"],
          json["middle_name"],
          json["last_name"],
          json["date_of_birth"],
          json["title"],
          json["country"],
          json["nationality"],
          json["city"],
          json["subcity"],
          json["woreda"],
          json["house_number"],
          json["date_of_death"],
        ),
        CertificateDetail([], DateTime.parse(json["issue_date"]),
            DateTime.parse(json["application_date"])),
        false);
  }
}

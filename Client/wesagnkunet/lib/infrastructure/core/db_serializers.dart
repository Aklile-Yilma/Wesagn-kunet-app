

import 'package:flutter/material.dart';
import 'package:wesagnkunet/domain/core/certificate.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/lib/network/Serializer.dart';

class MarriageCertificateDBSerializer extends Serializer<MarriageCertificate>{

  @override
  Map<String, dynamic> serialize(instance) {

    String? issueDate = null;
    if(instance.detail.issueDate != null){
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
      "marriage_date": instance.marriageDate.toString(),
      "issue_date": issueDate,
      "application_date": instance.detail.applicationDate.toString()
    };

  }
  
  @override
  MarriageCertificate deSerialize(dynamic json) {

    DateTime? issueDate;
    if(json["issue_date"] != null){
      issueDate = DateTime.parse(json["issue_date"]);
    }


    return MarriageCertificate(
                        json["id"],
                        Spouse(
                          json["wife_first_name"],
                          json["wife_middle_name"],
                          json["wife_last_name"]
                        ),
                        Spouse(
                          json["husband_first_name"],
                          json["husband_middle_name"],
                          json["husband_last_name"]
                        ),
                        CertificateDetail(
                          [],
                          issueDate,
                          DateTime.parse(json["application_date"])
                        ),
                        DateTime.parse(json["marriage_date"]),
                        false
                      );

  }
}
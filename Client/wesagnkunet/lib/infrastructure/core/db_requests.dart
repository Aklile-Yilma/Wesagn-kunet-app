
import 'dart:developer';

import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/db_serializers.dart';
import 'package:wesagnkunet/infrastructure/lib/localdb/DBRequest.dart';

abstract class MarriageCertificateDBRequest<R> extends DBRequest<R>{

  MarriageCertificateDBRequest({inputMap, type, condition, conditionArgs}): super("core_marriage_certificate",
                                                                                inputMap: inputMap,
                                                                                type: type,
                                                                                condition: condition,
                                                                                conditionArgs: conditionArgs
                                                                                );

  @override
  String getCreateTableQuery() {
    return '''
    CREATE TABLE $tableName (
      id integer primary key,
      
      wife_first_name text not null,
      wife_middle_name text not null,
      wife_last_name text not null,
      
      husband_first_name text not null,
      husband_middle_name text not null,
      husband_last_name text not null,
      
      marriage_date text not null,

      issue_date text,
      application_date text
    );
    ''';
  }

}


class GetMarriageCertificateDBRequest extends MarriageCertificateDBRequest<MarriageCertificate>{
  
  MarriageCertificateDBSerializer serializer = MarriageCertificateDBSerializer();

  GetMarriageCertificateDBRequest(int certifcateId): super(
                                                        type: OperationType.select,
                                                        condition: "id = ?",
                                                        conditionArgs: [certifcateId]
                                                      );
  
  @override
  MarriageCertificate? deserializeObject(response) {
    
    if(response.isEmpty){
      return null;
    }

    return serializer.deSerialize(response.first);
  }

}


class GetAllMarraigeCertificatesDBRequest extends MarriageCertificateDBRequest<List<MarriageCertificate>>{
  
  MarriageCertificateDBSerializer serializer = MarriageCertificateDBSerializer();

  GetAllMarraigeCertificatesDBRequest(): super(
                                              type: OperationType.select
                                            );

  @override
  List<MarriageCertificate>? deserializeObject(response) {
    // TODO: implement deserializeObject
    if(response.length == 0){
      return null;
    }

    log("Found ${response.length} Results from cache");

    List<MarriageCertificate> certificates = [];
    for(Map<String, dynamic> json in response){
      certificates.add(serializer.deSerialize(json));
    }
    return certificates;
  }

}


class InsertMarriageCertificateDBRequest extends MarriageCertificateDBRequest<int>{

  MarriageCertificateDBSerializer serializer = MarriageCertificateDBSerializer();

  MarriageCertificate certificate;

  InsertMarriageCertificateDBRequest(this.certificate): super(
                                                            type: OperationType.insert,
                                                        );

  @override
  Map<String, dynamic> getInputMap() {
    return serializer.serialize(certificate);
  }

  @override
  int? deserializeObject(response) {
    return response;
  }

}
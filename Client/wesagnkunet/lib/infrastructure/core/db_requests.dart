import 'package:wesagnkunet/domain/core/birth_certificate.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/db_serializers.dart';
import 'package:wesagnkunet/infrastructure/lib/localdb/DBRequest.dart';

abstract class MarriageCertificateDBRequest<R> extends DBRequest<R> {
  MarriageCertificateDBRequest({inputMap, type, condition, conditionArgs})
      : super("core_marriage_certificate",
            inputMap: inputMap,
            type: type,
            condition: condition,
            conditionArgs: conditionArgs);

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
      
      issue_date text,
      application_date text
    )
    ''';
  }
}

class GetMarriageCertificateDBRequest
    extends MarriageCertificateDBRequest<MarriageCertificate> {
  MarriageCertificateDBSerializer serializer =
      MarriageCertificateDBSerializer();

  GetMarriageCertificateDBRequest(int certifcateId)
      : super(
            type: OperationType.select,
            condition: "id = ?",
            conditionArgs: [certifcateId]);

  @override
  MarriageCertificate? deserializeObject(response) {
    if (response.isEmpty) {
      return null;
    }

    return serializer.deSerialize(response.first);
  }
}

class InsertMarriageCertificateDBRequest
    extends MarriageCertificateDBRequest<int> {
  MarriageCertificateDBSerializer serializer =
      MarriageCertificateDBSerializer();

  MarriageCertificate certificate;

  InsertMarriageCertificateDBRequest(this.certificate)
      : super(
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

abstract class BirthCertificateDBRequest<R> extends DBRequest<R> {
  BirthCertificateDBRequest({inputMap, type, condition, conditionArgs})
      : super("core_marriage_certificate",
            inputMap: inputMap,
            type: type,
            condition: condition,
            conditionArgs: conditionArgs);

  @override
  String getCreateTableQuery() {
    return '''
    CREATE TABLE $tableName (
      id integer primary key,
      
      child_first_name text not null,
      child_middle_name text not null,
      child_last_name text not null,
      child_gender text not null,
      child_birth_date text not null,

      father_first_name text not null,
      father_middle_name text not null,
      father_last_name text not null,

      mother_first_name text not null,
      mother_middle_name text not null,
      mother_last_name text not null,
      
      
      issue_date text,
      application_date text
    )
    ''';
  }
}

class GetBirthCertificateDBRequest
    extends BirthCertificateDBRequest<BirthCertificate> {
  BirthCertificateDBSerializer serializer = BirthCertificateDBSerializer();

  GetBirthCertificateDBRequest(int certifcateId)
      : super(
            type: OperationType.select,
            condition: "id = ?",
            conditionArgs: [certifcateId]);

  @override
  BirthCertificate? deserializeObject(response) {
    if (response.isEmpty) {
      return null;
    }

    return serializer.deSerialize(response.first);
  }
}

class InsertBirthCertificateDBRequest extends BirthCertificateDBRequest<int> {
  BirthCertificateDBSerializer serializer = BirthCertificateDBSerializer();

  BirthCertificate certificate;

  InsertBirthCertificateDBRequest(this.certificate)
      : super(
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

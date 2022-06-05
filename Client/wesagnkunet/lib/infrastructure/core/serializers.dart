import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/core/birth_certificate.dart';
import 'package:wesagnkunet/domain/core/certificate.dart';
import 'package:wesagnkunet/domain/core/death_certificates.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/auth/serializers.dart';
import 'package:wesagnkunet/infrastructure/lib/network/Serializer.dart';

class CertificateDetailSerializer extends Serializer<CertificateDetail> {
  @override
  CertificateDetail deSerialize(json) {
    final ClientSerializer clientSerializer = ClientSerializer();

    List<Client> users = [];
    for (int i = 0; i < json["users"].length; i++) {
      users.add(clientSerializer.deSerialize(json["users"][i]));
    }

    DateTime? issueDate;
    if (json["issue_date"] == null) {
      issueDate = null;
    } else {
      issueDate = DateTime.parse(json["issue_date"]);
    }

    return CertificateDetail(
        users, issueDate, DateTime.parse(json["application_date"]));
  }

  @override
  serialize(CertificateDetail instance) {
    // TODO: implement serialize
    throw UnimplementedError();
  }
}

class SpouseSerializer extends Serializer<Spouse> {
  @override
  Spouse deSerialize(json) {
    return Spouse(json["first_name"], json["middle_name"], json["last_name"]);
  }

  @override
  serialize(Spouse instance) {
    return {
      "first_name": instance.firstName,
      "middle_name": instance.middleName,
      "last_name": instance.lastName
    };
  }
}

class MarriageCertificateSerializer extends Serializer<MarriageCertificate> {
  SpouseSerializer spouseSerializer = SpouseSerializer();
  CertificateDetailSerializer certificateDetailSerializer =
      CertificateDetailSerializer();

  @override
  MarriageCertificate deSerialize(json) {
    return MarriageCertificate(
        json["id"],
        spouseSerializer.deSerialize(json["wife"]),
        spouseSerializer.deSerialize(json["husband"]),
        certificateDetailSerializer.deSerialize(json["detail"]),
        DateTime.parse(json["marriage_date"]),
        json["verified"]);
  }

  @override
  serialize(MarriageCertificate instance) {
    return {
      "wife": spouseSerializer.serialize(instance.wife),
      "husband": spouseSerializer.serialize(instance.husband),
      "marriage_date": instance.marriageDate.toString().split(" ")[0]
    };
  }
}

class ChildSerializer extends Serializer<Child> {
  @override
  Child deSerialize(json) {
    return Child(json["first_name"], json["middle_name"], json["last_name"]);
  }

  @override
  serialize(Child instance) {
    // TODO: implement serialize
    return {
      "first_name": instance.first_name,
      "middle_name": instance.middle_name,
      "last_name": instance.last_name
    };
  }
}

class ParentInformationSerializer extends Serializer<ParentInformation> {
  @override
  ParentInformation deSerialize(json) {
    return ParentInformation(
        json["first_name"], json["middle_name"], json["last_name"]);
  }

  @override
  serialize(ParentInformation instance) {
    return {
      "first_name": instance.first_name,
      "middle_name": instance.middle_name,
      "last_name": instance.last_name
    };
  }
}

class BirthCertificateSerializer extends Serializer<BirthCertificate> {
  ChildSerializer childSerializer = ChildSerializer();
  ParentInformationSerializer parentInformationSerializer =
      ParentInformationSerializer();
  CertificateDetailSerializer certificateDetailSerializer =
      CertificateDetailSerializer();

  @override
  BirthCertificate deSerialize(json) {
    return BirthCertificate(
        json["id"],
        childSerializer.deSerialize(json["child"]),
        parentInformationSerializer.deSerialize(json["father"]),
        parentInformationSerializer.deSerialize(json["mother"]),
        certificateDetailSerializer.deSerialize(json["detail"]),
        json["gender"],
        DateTime.parse(json["birth_date"]),
        json["verified"]);
  }

  @override
  serialize(BirthCertificate instance) {
    // TODO: implement serialize
    return {
      "child": childSerializer.serialize(instance.child),
      "father": parentInformationSerializer.serialize(instance.father),
      "mother": parentInformationSerializer.serialize(instance.mother),
      "birth_date": instance.birthDate.toString().split(" ")[0]
    };
  }
}

class DeathSerializer extends Serializer<DeceasedInformation> {
  @override
  DeceasedInformation deSerialize(json) {
    return DeceasedInformation(
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
    );
  }

  @override
  serialize(DeceasedInformation instance) {
    return {
      "first_name": instance.first_name,
      "middle_name": instance.middle_name,
      "last_name": instance.last_name,
    };
  }
}

class DeathCertificateSerializer extends Serializer<DeathCertificate> {
  DeathSerializer deathSerializer = DeathSerializer();
  CertificateDetailSerializer certificateDetailSerializer =
      CertificateDetailSerializer();

  @override
  DeathCertificate deSerialize(json) {
    return DeathCertificate(
        json["id"],
        deathSerializer.deSerialize(json["deceasedInformation"]),
        certificateDetailSerializer.deSerialize(json["detail"]),
        json["verified"]);
  }

  @override
  serialize(DeathCertificate instance) {
    return {
      "deceasedInformation":
          deathSerializer.serialize(instance.deceasedInformation),
      "death_of_date":
          instance.deceasedInformation.date_of_death.toString().split(" ")[0]
    };
  }
}

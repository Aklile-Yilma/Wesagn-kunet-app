import 'dart:convert';
import 'dart:developer';

import 'package:wesagnkunet/domain/core/birth_certificate.dart';
import 'package:wesagnkunet/domain/core/death_certificates.dart';
import 'package:wesagnkunet/infrastructure/lib/network/Request.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/serializers.dart';

class GetMarriageCertificatesRequest
    extends Request<List<MarriageCertificate>> {
  GetMarriageCertificatesRequest() : super("/core/marriage/");

  @override
  List<MarriageCertificate> deserializeObject(response) {
    List<MarriageCertificate> certificateList = [];
    List<dynamic> json = jsonDecode(response);

    final MarriageCertificateSerializer serializer =
        MarriageCertificateSerializer();

    for (int i = 0; i < json.length; i++) {
      certificateList.add(serializer.deSerialize(json[i]));
    }

    return certificateList;
  }
}

class GetMarriageCertificateRequest extends Request<MarriageCertificate> {
  MarriageCertificateSerializer serializer = MarriageCertificateSerializer();

  GetMarriageCertificateRequest(int certificateId)
      : super("/core/marriage/$certificateId");

  @override
  MarriageCertificate deserializeObject(response) {
    return serializer.deSerialize(jsonDecode(response));
  }
}

class CreateMarriageCertificateRequest extends Request<MarriageCertificate> {
  MarriageCertificateSerializer serializer = MarriageCertificateSerializer();
  MarriageCertificate certificate;

  CreateMarriageCertificateRequest(this.certificate)
      : super("/core/marriage/", method: Method.post);

  @override
  Map<String, dynamic> getPostData() {
    return serializer.serialize(certificate);
  }

  @override
  MarriageCertificate deserializeObject(response) {
    log(response);
    return serializer.deSerialize(jsonDecode(response));
  }
}

class VerifyMarriageCertificateRequest extends Request<MarriageCertificate> {
  MarriageCertificateSerializer serializer = MarriageCertificateSerializer();

  VerifyMarriageCertificateRequest(int certificateId)
      : super("/core/marriage/$certificateId/",
            method: Method.patch,
            postParams: {"pk": certificateId, "verified": true});

  @override
  MarriageCertificate deserializeObject(response) {
    return serializer.deSerialize(jsonDecode(response));
  }
}

class DeleteMarriageCertificateRequest extends Request<void> {
  DeleteMarriageCertificateRequest(int certificateId)
      : super("/core/marriage/$certificateId/", method: Method.delete);

  @override
  void deserializeObject(response) {
    return;
  }
}

class GetBirthCertificatesRequest extends Request<List<BirthCertificate>> {
  GetBirthCertificatesRequest() : super("/core/birth/");

  @override
  List<BirthCertificate> deserializeObject(response) {
    List<BirthCertificate> certificateList = [];
    List<dynamic> json = jsonDecode(response);

    final BirthCertificateSerializer serializer = BirthCertificateSerializer();

    for (int i = 0; i < json.length; i++) {
      certificateList.add(serializer.deSerialize(json[i]));
    }

    return certificateList;
  }
}

class CreateBirthCertificateRequest extends Request<BirthCertificate> {
  BirthCertificateSerializer serializer = BirthCertificateSerializer();

  BirthCertificate certificate;

  CreateBirthCertificateRequest(this.certificate)
      : super("/core/birth", method: Method.post);

  @override
  Map<String, dynamic> getPostData() {
    return serializer.serialize(certificate);
  }

  @override
  BirthCertificate deserializeObject(response) {
    log(response);
    return serializer.deSerialize(jsonDecode(response));
  }
}

class VerifyBirthCertificateRequest extends Request<BirthCertificate> {
  BirthCertificateSerializer serializer = BirthCertificateSerializer();

  VerifyBirthCertificateRequest(int certificateId)
      : super("/core/birth/$certificateId/",
            method: Method.patch,
            postParams: {"pk": certificateId, "verified": true});

  @override
  BirthCertificate deserializeObject(response) {
    return serializer.deSerialize(jsonDecode(response));
  }
}

class GetDeathCertificatesRequest extends Request<List<DeathCertificate>> {
  GetDeathCertificatesRequest() : super("/core/death/");

  @override
  List<DeathCertificate> deserializeObject(response) {
    List<DeathCertificate> certificateList = [];
    List<dynamic> json = jsonDecode(response);

    final DeathCertificateSerializer serializer = DeathCertificateSerializer();

    for (int i = 0; i < json.length; i++) {
      certificateList.add(serializer.deSerialize(json[i]));
    }

    return certificateList;
  }
}

class CreateDeathCertificateRequest extends Request<DeathCertificate> {
  DeathCertificateSerializer serializer = DeathCertificateSerializer();
  DeathCertificate certificate;

  CreateDeathCertificateRequest(this.certificate)
      : super("/core/death/", method: Method.post);

  @override
  Map<String, dynamic> getPostData() {
    return serializer.serialize(certificate);
  }

  @override
  DeathCertificate deserializeObject(response) {
    log(response);
    return serializer.deSerialize(jsonDecode(response));
  }
}

class VerifyDeathCertificateRequest extends Request<DeathCertificate> {
  DeathCertificateSerializer serializer = DeathCertificateSerializer();

  VerifyDeathCertificateRequest(int certificateId)
      : super("/core/death/$certificateId/",
            method: Method.patch,
            postParams: {"pk": certificateId, "verified": true});

  @override
  DeathCertificate deserializeObject(response) {
    return serializer.deSerialize(jsonDecode(response));
  }
}

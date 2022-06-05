import 'package:wesagnkunet/domain/core/birth_certificate.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/requests.dart';
import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';
import 'package:wesagnkunet/infrastructure/lib/repository.dart';

class MarriageCertificatesRepositoryCall
    extends RepositoryCall<void, List<MarriageCertificate>> {
  ApiClient apiClient;

  MarriageCertificatesRepositoryCall(this.apiClient);

  @override
  Future<List<MarriageCertificate>?> getCached(input) async {
    return null;
  }

  @override
  Future<List<MarriageCertificate>> networkCall(input) async {
    return apiClient.execute(GetMarriageCertificatesRequest());
  }

  @override
  void storeCache(value) {
    // TODO: implement storeCache
  }
}

class MarriageCertificateRepository {
  ApiClient apiClient;

  MarriageCertificateRepository(this.apiClient);

  Future<List<MarriageCertificate>> getAll() async {
    return await MarriageCertificatesRepositoryCall(apiClient).get(null);
  }

  Future<MarriageCertificate> create(MarriageCertificate certificate) async {
    return await apiClient
        .execute(CreateMarriageCertificateRequest(certificate));
  }

  Future<MarriageCertificate> verify(int certificateId) async {
    return await apiClient
        .execute(VerifyMarriageCertificateRequest(certificateId));
  }
}

class BirthCertificatesRepositoryCall
    extends RepositoryCall<void, List<BirthCertificate>> {
  ApiClient apiClient;

  BirthCertificatesRepositoryCall(this.apiClient);

  @override
  Future<List<BirthCertificate>?> getCached(input) async {
    return null;
  }

  @override
  Future<List<BirthCertificate>> networkCall(input) async {
    return apiClient.execute(GetBirthCertificatesRequest());
  }

  @override
  void storeCache(value) {}
}

class BirthCertificateRepository {
  ApiClient apiClient;

  BirthCertificateRepository(this.apiClient);

  Future<List<BirthCertificate>?> getAll() async {
    return await BirthCertificatesRepositoryCall(apiClient).get(null);
  }

  Future<BirthCertificate> create(BirthCertificate certificate) async {
    return await apiClient.execute(CreateBirthCertificateRequest(certificate));
  }

  Future<BirthCertificate> verify(int certificateId) async {
    return await apiClient
        .execute(VerifyBirthCertificateRequest(certificateId));
  }
}

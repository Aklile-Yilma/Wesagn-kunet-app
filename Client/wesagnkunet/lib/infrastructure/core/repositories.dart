import 'package:wesagnkunet/domain/core/birth_certificate.dart';
import 'package:wesagnkunet/domain/core/death_certificates.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/db_requests.dart';
import 'package:wesagnkunet/infrastructure/core/requests.dart';
import 'package:wesagnkunet/infrastructure/lib/localdb/DBClient.dart';
import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';
import 'package:wesagnkunet/infrastructure/lib/repository.dart';

class MarriageCertificatesRepositoryCall
    extends RepositoryCall<void, List<MarriageCertificate>> {
  ApiClient apiClient;
  DBClient dbClient;

  MarriageCertificatesRepositoryCall(this.apiClient, this.dbClient);

  @override
  Future<List<MarriageCertificate>?> getCached(input) async {
    return await dbClient.execute(GetAllMarraigeCertificatesDBRequest());
  }

  @override
  Future<List<MarriageCertificate>> networkCall(input) async {
    return apiClient.execute(GetMarriageCertificatesRequest());
  }

  @override
  void storeCache(value) {
    for(MarriageCertificate certificate in value){
      dbClient.execute(InsertMarriageCertificateDBRequest(certificate));
    }
  }
}

class MarriageCertificateRepositoryCall
    extends RepositoryCall<int, MarriageCertificate> {
  ApiClient apiClient;

  MarriageCertificateRepositoryCall(this.apiClient);

  @override
  Future<MarriageCertificate?> getCached(int input) async {
    return null;
  }

  @override
  Future<MarriageCertificate> networkCall(int input) async {
    return apiClient.execute(GetMarriageCertificateRequest(input));
  }

  @override
  void storeCache(MarriageCertificate value) async {
    // TODO: implement storeCache
  }
}

class MarriageCertificateRepository {
  ApiClient apiClient;
  DBClient dbClient;

  MarriageCertificateRepository(this.apiClient, this.dbClient);

  Future<List<MarriageCertificate>> getAll() async {
    return await MarriageCertificatesRepositoryCall(apiClient, dbClient).get(null);
  }

  Future<MarriageCertificate> getById(int certificateId) async {
    return await MarriageCertificateRepositoryCall(apiClient)
        .get(certificateId);
  }

  Future<MarriageCertificate> create(MarriageCertificate certificate) async {
    return await apiClient
        .execute(CreateMarriageCertificateRequest(certificate));
  }

  Future<MarriageCertificate> verify(int certificateId) async {
    return await apiClient
        .execute(VerifyMarriageCertificateRequest(certificateId));
  }

  Future<void> delete(int certificateId) async {
    return await apiClient
        .execute(DeleteMarriageCertificateRequest(certificateId));
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

class BirthCertificateRepositoryCall
    extends RepositoryCall<int, BirthCertificate> {
  ApiClient apiClient;

  BirthCertificateRepositoryCall(this.apiClient);

  @override
  Future<BirthCertificate?> getCached(int input) async {
    return null;
  }

  @override
  Future<BirthCertificate> networkCall(int input) async {
    return apiClient.execute(GetBirthCertificateRequest(input));
  }

  @override
  void storeCache(BirthCertificate value) async {
    // TODO: implement storeCache
  }
}

class BirthCertificateRepository {
  ApiClient apiClient;

  BirthCertificateRepository(this.apiClient);

  Future<List<BirthCertificate>?> getAll() async {
    return await BirthCertificatesRepositoryCall(apiClient).get(null);
  }

  Future<BirthCertificate> getById(int certificateId) async {
    return await BirthCertificateRepositoryCall(apiClient)
        .get(certificateId);
  }

  Future<BirthCertificate> create(BirthCertificate certificate) async {
    return await apiClient.execute(CreateBirthCertificateRequest(certificate));
  }

  Future<BirthCertificate> verify(int certificateId) async {
    return await apiClient
        .execute(VerifyBirthCertificateRequest(certificateId));
  }
  Future<void> delete(int certificateId) async {
    return await apiClient
        .execute(DeleteBirthCertificateRequest(certificateId));
  }
}

class DeathCertificatesRepositoryCall
    extends RepositoryCall<void, List<DeathCertificate>> {
  ApiClient apiClient;

  DeathCertificatesRepositoryCall(this.apiClient);

  @override
  Future<List<DeathCertificate>?> getCached(input) async {
    return null;
  }

  @override
  Future<List<DeathCertificate>> networkCall(input) async {
    return apiClient.execute(GetDeathCertificatesRequest());
  }

  @override
  void storeCache(value) {
    // TODO: implement storeCache
  }
}

class DeathCertificateRepositoryCall
    extends RepositoryCall<int, DeathCertificate> {
  ApiClient apiClient;

  DeathCertificateRepositoryCall(this.apiClient);

  @override
  Future<DeathCertificate?> getCached(int input) async {
    return null;
  }

  @override
  Future<DeathCertificate> networkCall(int input) async {
    return apiClient.execute(GetDeathCertificateRequest(input));
  }

  @override
  void storeCache(DeathCertificate value) async {
    // TODO: implement storeCache
  }
}

class DeathCertificateRepository {
  ApiClient apiClient;

  DeathCertificateRepository(this.apiClient);

  Future<List<DeathCertificate>> getAll() async {
    return await DeathCertificatesRepositoryCall(apiClient).get(null);
  }

    Future<DeathCertificate> getById(int certificateId) async {
    return await DeathCertificateRepositoryCall(apiClient)
        .get(certificateId);
  }

  Future<DeathCertificate> create(DeathCertificate certificate) async {
    return await apiClient.execute(CreateDeathCertificateRequest(certificate));
  }

  Future<DeathCertificate> verify(int certificateId) async {
    return await apiClient
        .execute(VerifyDeathCertificateRequest(certificateId));
  }

   Future<void> delete(int certificateId) async {
    return await apiClient
        .execute(DeleteDeathCertificateRequest(certificateId));
  }
}

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

class MarriageCertificateRepository {
  ApiClient apiClient;
  DBClient dbClient;

  MarriageCertificateRepository(this.apiClient, this.dbClient);

  Future<List<MarriageCertificate>> getAll() async {
    return await MarriageCertificatesRepositoryCall(apiClient, dbClient).get(null);
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

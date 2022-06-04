import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/requests.dart';
import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';
import 'package:wesagnkunet/infrastructure/lib/repository.dart';




class MarriageCertificatesRepositoryCall extends RepositoryCall<void, List<MarriageCertificate>>{
 

	ApiClient apiClient;

	MarriageCertificatesRepositoryCall(this.apiClient);
 

	@override
	Future<List<MarriageCertificate>?> getCached(input) async{
		return null;
	}

	@override
	Future<List<MarriageCertificate>> networkCall(input) async{
		return apiClient.execute(GetMarriageCertificatesRequest());
	}

	@override
	void storeCache(value) {
		// TODO: implement storeCache
	}

}


class MarriageCertificateRepository{

  ApiClient apiClient;

  MarriageCertificateRepository(this.apiClient);

  Future<List<MarriageCertificate>> getAll(){
    return MarriageCertificatesRepositoryCall(apiClient).get(null);
  }

}



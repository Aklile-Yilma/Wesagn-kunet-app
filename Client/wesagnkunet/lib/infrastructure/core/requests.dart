import 'dart:convert';
import 'dart:developer';

import 'package:wesagnkunet/infrastructure/lib/network/Request.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/serializers.dart';


class GetMarriageCertificatesRequest extends Request<List<MarriageCertificate>>{

	GetMarriageCertificatesRequest(): super("/core/marriage/");

	@override
	List<MarriageCertificate> deserializeObject(response) {

		List<MarriageCertificate> certificateList = [];
		List<dynamic> json = jsonDecode(response);

		final MarriageCertificateSerializer serializer = MarriageCertificateSerializer();

		for(int i=0; i<json.length; i++){

			certificateList.add(serializer.deSerialize(json[i]));

		}

		return certificateList;

	}

}


class CreateMarriageCertificateRequest extends  Request<MarriageCertificate>{
  
  MarriageCertificateSerializer serializer = MarriageCertificateSerializer();
  MarriageCertificate certificate;
 
  CreateMarriageCertificateRequest(this.certificate): super(
                                                          "/core/marriage/",
                                                          method: Method.post
                                                        );

  @override
  Map<String, dynamic> getPostData() {
    return serializer.serialize(certificate);
  }

  @override
  MarriageCertificate deserializeObject(response) {
    return serializer.deSerialize(jsonDecode(response));
  }

}


class VerifyMarriageCertificateRequest extends Request<MarriageCertificate>{

  MarriageCertificateSerializer serializer = MarriageCertificateSerializer();

  VerifyMarriageCertificateRequest(int certificateId): super(
                                                                          "/core/marriage/$certificateId/",
                                                                          method: Method.patch,
                                                                          postParams: {
                                                                            "pk": certificateId,
                                                                            "verified": true
                                                                          }
                                                                        );

  @override
  MarriageCertificate deserializeObject(response) {
    return serializer.deSerialize(jsonDecode(response));
  }

}


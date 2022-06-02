import 'dart:convert';

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
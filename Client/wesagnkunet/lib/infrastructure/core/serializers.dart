



import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/core/certificate.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/auth/serializers.dart';
import 'package:wesagnkunet/infrastructure/core/network/Serializer.dart';

import '../../domain/auth/user.dart';


class CertificateDetailSerializer extends Serializer<CertificateDetail>{
	
	@override
	CertificateDetail deSerialize(json) {
		final ClientSerializer clientSerializer = ClientSerializer();

		List<Client> users = [];
		for(int i=0; i<json["users"].length; i++){
			users.add(clientSerializer.deSerialize(json["users"][i]));
		}
		

		return CertificateDetail(
			users,
			DateTime.parse(json["issue_date"]),
			DateTime.parse(json["application_date"])
		);
	}

	@override
	serialize(CertificateDetail instance) {
		// TODO: implement serialize
		throw UnimplementedError();
	}

	
}


class SpouseSerializer extends Serializer<Spouse>{

	@override
  Spouse deSerialize(json) {
    return Spouse(json["first_name"], json["middle_name"], json["last_name"]);
  }

	@override
  serialize(Spouse instance) {
    // TODO: implement serialize
    throw UnimplementedError();
  }

}

class MarriageCertificateSerializer extends Serializer<MarriageCertificate>{

	SpouseSerializer spouseSerializer = SpouseSerializer();
	CertificateDetailSerializer certificateDetailSerializer = CertificateDetailSerializer();


	@override
  MarriageCertificate deSerialize(json) {

		return MarriageCertificate(
			json["id"],
			spouseSerializer.deSerialize(json["wife"]),
			spouseSerializer.deSerialize(json["husband"]),
			certificateDetailSerializer.deSerialize(json["detail"]),
			DateTime.parse(json["marriage_date"])
		);

  }

  @override
  serialize(MarriageCertificate instance) {
    // TODO: implement serialize
    throw UnimplementedError();
  }


	
}




import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/core/certificate.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/auth/serializers.dart';
import 'package:wesagnkunet/infrastructure/lib/network/Serializer.dart';


class CertificateDetailSerializer extends Serializer<CertificateDetail>{
	
	@override
	CertificateDetail deSerialize(json) {
		final ClientSerializer clientSerializer = ClientSerializer();

		List<Client> users = [];
		for(int i=0; i<json["users"].length; i++){
			users.add(clientSerializer.deSerialize(json["users"][i]));
		}
		

    DateTime? issueDate;
    if(json["issue_date"] == null){
      issueDate = null;
    }
    else{
      issueDate = DateTime.parse(json["issue_date"]);
    }

		return CertificateDetail(
			users,
			issueDate,
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
    return {
      "first_name": instance.firstName,
      "middle_name": instance.middleName,
      "last_name": instance.lastName
    };
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
			DateTime.parse(json["marriage_date"]),
      json["verified"]
		);

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
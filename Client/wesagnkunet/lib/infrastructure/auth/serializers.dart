


import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/auth/user.dart';
import 'package:wesagnkunet/infrastructure/core/network/Serializer.dart';

class UserSerializer extends Serializer<User>{
	
	@override
	User deSerialize(json) {
		throw UnimplementedError();
	}

	@override
	dynamic serialize(User instance) {
		// TODO: implement serialize
	}



}


class ClientSerializer extends Serializer<Client>{

	@override
	Client deSerialize(json) {

		return Client(
			json["pk"],
			json["user"],
			json["first_name"],
			json["middle_name"],
			json["last_name"],
			json["sex"],
			DateTime.parse(json["date_of_birth"]),
			json["blood_type"],
			json["city"],
			json["country"],
			json["nationality"],
			json["phone_number"],
			json["photo"]
		);

	}

	@override
	serialize(Client instance) {
		// TODO: implement serialize
		throw UnimplementedError();
	}


}
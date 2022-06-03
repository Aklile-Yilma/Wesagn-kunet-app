import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/auth/user.dart';
import 'package:wesagnkunet/infrastructure/lib/network/Serializer.dart';


class UserSerializer extends Serializer<User>{
	
	@override
	User deSerialize(json) {
		return User(
			json["pk"],
			json["username"],
			json["email"]
		);
	}

	@override
	dynamic serialize(User instance) {
		return {
			"pk": instance.id,
			"username": instance.username,
			"email": instance.email,
			"password": instance.password
		};
	}

}


class ClientSerializer extends Serializer<Client>{

	UserSerializer userSerializer = UserSerializer();

	@override
	Client deSerialize(json) {

		return Client(
			json["pk"],
			userSerializer.deSerialize(json["user"]),
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
		);

	}

	@override
	serialize(Client instance) {
		return {
			"id": instance.pk,
			"user": userSerializer.serialize(instance.user),
			"first_name": instance.firstName,
			"middle_name": instance.middleName,
			"last_name": instance.lastName,
			"sex": instance.sex,
			"date_of_birth": instance.dateOfBirth.toString().split(" ")[0],
			"blood_type": instance.bloodType,
			"city": instance.city,
			"country": instance.country,
			"nationality": instance.nationality,
			"phone_number": instance.phoneNumber,
		};
	}


}
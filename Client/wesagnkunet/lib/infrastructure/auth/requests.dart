


import 'dart:convert';

import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/auth/signup_response.dart';
import 'package:wesagnkunet/domain/auth/token.dart';
import 'package:wesagnkunet/infrastructure/auth/serializers.dart';
import 'package:wesagnkunet/infrastructure/lib/network/Request.dart';


class LoginRequest extends Request<JWTToken>{

  JWTSerializer serializer = JWTSerializer();

	LoginRequest(username, password): super(
																				"/token/create/",
																				method: Method.post,
																				postParams: {
																					"username": username,
																					"password": password
																				}
																			 );

	@override
	JWTToken deserializeObject(response) {
		return serializer.deSerialize(jsonDecode(response));
	}

}


class SignupRequest extends Request<SignupResponse>{
  
  JWTSerializer jwtSerializer = JWTSerializer();
	ClientSerializer clientSerializer = ClientSerializer();
	Client client;


	SignupRequest(this.client):
	super(
		"/auth/signup/",
		method: Method.post
		);

	@override
  Map<String, dynamic> getPostData() {
		Map<String, dynamic> data = clientSerializer.serialize(client);
		data.addAll(data["user"]);
		data.remove("user");
		data.remove("pk");
		data.remove("id");
		return data;
  }

	
	@override
  SignupResponse deserializeObject(response) {
		
		Map<String, dynamic> json = jsonDecode(response);
		return SignupResponse(
											jwtSerializer.deSerialize(json["token"]),
											clientSerializer.deSerialize(json["client"])
										);
  }

}


class GetMyAccountRequest extends Request<Client>{

  ClientSerializer serializer = ClientSerializer();


  GetMyAccountRequest(): super("/auth/my-account");

  @override
  Client deserializeObject(response) {
    return serializer.deSerialize(jsonDecode(response));
  }

}
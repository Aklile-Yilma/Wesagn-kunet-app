


import 'dart:convert';

import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/auth/signup_response.dart';
import 'package:wesagnkunet/infrastructure/auth/serializers.dart';
import 'package:wesagnkunet/infrastructure/lib/network/Request.dart';


class LoginRequest extends Request<String>{

	LoginRequest(username, password): super(
																				"/auth/login/",
																				method: Method.post,
																				postParams: {
																					"username": username,
																					"password": password
																				}
																			 );

	@override
	String deserializeObject(response) {
		return jsonDecode(response)["key"];
	}

}


class SignupRequest extends Request<SignupResponse>{
  
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
											json["token"],
											clientSerializer.deSerialize(json["client"])
										);
  }

}
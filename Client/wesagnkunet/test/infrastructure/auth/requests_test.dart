import 'package:flutter_test/flutter_test.dart';
import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/auth/signup_response.dart';
import 'package:wesagnkunet/domain/auth/user.dart';
import 'package:wesagnkunet/infrastructure/auth/requests.dart';

import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';
import 'package:wesagnkunet/Config.dart' as config;


String USERNAME = "osama";
String PASSWORD = "temppasswd";
String WRONG_PASSWORD = "wrong_password";

String EXPECTED_TOKEN = "38c28b019bf88949a0dc86cc88ce1c5a172042b4";

Client REQUEST_CLIENT = Client(
                          -1,
                          User(-1, "Nas", "nas@massapeal.com", password: "temppasswd"),
                          "Nasir",
                          "None",
                          "Jones",
                          "MALE",
                          DateTime.now(),
                          "A",
                          "Addis Ababa",
                          "Ethiopia",
                          "Ethiopian",
                          "+251912848343"
                        );


testLogin(ApiClient client) async{

  String? token = await client.execute(LoginRequest(USERNAME, PASSWORD));
  expect(token, EXPECTED_TOKEN);

}

testFailedLogin(ApiClient client) async{
  
  bool failed = false;

  try{
    await client.execute(LoginRequest(USERNAME, WRONG_PASSWORD));
    fail("Exception not thrown");
  } on ApiException catch (e){
    failed = true;
    expect(e.statusCode, 400);
  }
  expect(failed, true);
}


testSignup(ApiClient client) async{

  SignupResponse response = await client.execute(SignupRequest(REQUEST_CLIENT));

  expect(response.token, isNot(null));
  expect(response.client.firstName, REQUEST_CLIENT.firstName);
  expect(response.client.user.email, REQUEST_CLIENT.user.email);
  expect(response.client.user.password, null);

}


void main() {
  

  final ApiClient apiClient = ApiClient(config.API_HOST, baseUrl: config.API_PATH);

  group("Requests Test", () {

    test("Login Test", () async {
      await testLogin(apiClient);
    });

    test("Failed Login Test", () async {
      await testFailedLogin(apiClient);
    });

    test("Signup Test", () async{
      await testSignup(apiClient);
    });

  });

}
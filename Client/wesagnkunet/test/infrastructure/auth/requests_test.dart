import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/auth/signup_response.dart';
import 'package:wesagnkunet/domain/auth/token.dart';
import 'package:wesagnkunet/domain/auth/user.dart';
import 'package:wesagnkunet/infrastructure/auth/requests.dart';

import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';
import 'package:wesagnkunet/Config.dart' as config;


String USERNAME = "Nas";
String PASSWORD = "temppasswd";
String WRONG_PASSWORD = "wrong_password";

JWTToken EXPECTED_TOKEN = JWTToken(
                              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1NDUxMDIxMywiaWF0IjoxNjU0MzM3NDEzLCJqdGkiOiIzNmIxOTQ4YTUwOTA0Y2M5ODIzOTVjNDQ1MDQ4ZmFlYSIsInVzZXJfaWQiOjZ9.CJZQvbUtqzOTkbo2wMhYYBT7EAiS_pqwa2HBcYE1ZPs", 
                              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU0NDIzODEzLCJpYXQiOjE2NTQzMzc0MTMsImp0aSI6IjdlMDlhMWZiYjM4MjRjZjM5NTVmNDNjZGY5MjgyM2Y1IiwidXNlcl9pZCI6Nn0.6Lryb4uJ6ua_RToVjkDkU9HMd1QULOipFGT8vq-43qI"
                      );


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

  JWTToken? token = await client.execute(LoginRequest(USERNAME, PASSWORD));
  expect(token, isNot(null));
  // expect(token?.refresh, EXPECTED_TOKEN.refresh);
  // expect(token?.access, EXPECTED_TOKEN.access);


}

testFailedLogin(ApiClient client) async{
  
  bool failed = false;

  try{
    await client.execute(LoginRequest(USERNAME, WRONG_PASSWORD));
    fail("Exception not thrown");
  } on ApiException catch (e){
    failed = true;
    expect(e.statusCode, 401);
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
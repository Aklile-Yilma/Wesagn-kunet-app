import 'package:flutter_test/flutter_test.dart';
import 'package:wesagnkunet/infrastructure/auth/requests.dart';

import 'package:wesagnkunet/infrastructure/core/network/AplClient.dart';
import 'package:wesagnkunet/Config.dart' as config;


String USERNAME = "osama";
String PASSWORD = "temppasswd";
String WRONG_PASSWORD = "wrong_password";

String EXPECTED_TOKEN = "38c28b019bf88949a0dc86cc88ce1c5a172042b4";


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


void main() {
  

  final ApiClient apiClient = ApiClient(config.API_HOST, baseUrl: config.API_PATH);

  group("Requests Test", () {

    test("Login Test", () async {
      await testLogin(apiClient);
    });

    test("Failed Login Test", () async {
      await testFailedLogin(apiClient);
    });

  });

}
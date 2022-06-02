import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:wesagnkunet/infrastructure/core/network/AplClient.dart';
import 'package:wesagnkunet/infrastructure/core/network/Request.dart';



String MOCK_URL = "e717870b-b437-43a7-89c0-e6d1d6203228.mock.pstmn.io";

String TEST_REQUEST_RESPONSE = "Success";

String TEST_HEADER = "TOKEN";


class TestRequest extends Request<TestResponse>{
  
	TestRequest(): super("/test");

	@override
  TestResponse deserializeObject(response) {
		Map<String, dynamic> json = jsonDecode(response);
		return TestResponse(json["test"]);
  }
}

class TestResponse{

	String test;

	TestResponse(this.test);

}

testFunctionality(){

	final apiClient = ApiClient(MOCK_URL);

	apiClient.execute(TestRequest()).then((value) {
		expect(value, isNot(null));
		expect(value.test, TEST_REQUEST_RESPONSE);
	});

}


testHeader(){

  
	final apiClient = ApiClient(MOCK_URL, token: TEST_HEADER);

	apiClient.execute(TestRequest()).then((value) {
		expect(value, isNot(null));
		expect(value.test, TEST_REQUEST_RESPONSE);
	});
}


void main(){

	group( "ApiClient", (){
			test("Functionality Test", () {
				testFunctionality();
			});

      test("Header Token", () {
        testHeader();
      });

	});


}
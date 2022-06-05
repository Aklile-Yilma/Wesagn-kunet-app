import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:wesagnkunet/domain/core/certificate.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';
import 'package:wesagnkunet/infrastructure/core/requests.dart';
import 'package:wesagnkunet/Config.dart' as config;

int EXPECTED_LENGTH = 1;

String EXPECTED_WIFE_NAME = "Najwa";
String TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU0NDYyOTYxLCJpYXQiOjE2NTQzNzY1NjEsImp0aSI6IjgyODNlYjkwYzRhNDQ4MDBiNWQzYWJlNjFlMWQ2MDBhIiwidXNlcl9pZCI6N30.H-Gxz3GRgEWrs8P2qv8dTDqvx9de6hMd_7TW4eboyVM";
String ADMIN_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU0NDYzNzM4LCJpYXQiOjE2NTQzNzczMzgsImp0aSI6IjU4MGVlZmU2MDIxMTRiODlhNmRkZjAxMTE5NDQ4NjkzIiwidXNlcl9pZCI6MX0.sItLZC6ereZpz2LW3NSeS1z_-5X-0yk9f5LksjKwOF4";
MarriageCertificate CREATE_CERTIFICATE = MarriageCertificate(
                                                      -1,
                                                      Spouse(
                                                        "Kim",
                                                        "Mathew",
                                                        "Mathers"
                                                      ),
                                                      Spouse(
                                                        "Marshall",
                                                        "Mathew",
                                                        "Mathers"
                                                      ),
                                                      CertificateDetail(
                                                        [],
                                                        DateTime.now(),
                                                        DateTime.now()
                                                      ),
                                                      DateTime.now(),
                                                      false,
                                                    );


int VERIFY_CERTIFICATE_ID = 2;


testMarraigeCertificates(ApiClient client) async {
  List<MarriageCertificate> certificates =
      await client.execute(GetMarriageCertificatesRequest());

  expect(certificates.length, EXPECTED_LENGTH);
  expect(certificates[0].wife.firstName, EXPECTED_WIFE_NAME);
}


testCreateMarriageCertificate(ApiClient client) async{

  MarriageCertificate certificate = await client.execute(CreateMarriageCertificateRequest(CREATE_CERTIFICATE));

  expect(certificate, isNot(null));
  expect(certificate.id > 0, true);

}

testVerifyMarriageCertificate(ApiClient adminClient) async{

  MarriageCertificate certificate = await adminClient.execute(VerifyMarriageCertificateRequest(VERIFY_CERTIFICATE_ID));
  expect(certificate, isNot(null));
  expect(certificate.verified, true);

}

void main() {
  ApiClient client =
      ApiClient(config.API_HOST, baseUrl: config.API_PATH, token: TOKEN);

  ApiClient adminClient = ApiClient(config.API_HOST, baseUrl: config.API_PATH, token: ADMIN_TOKEN);

  group("Core Requests Tests", () {
    test("Marriage Certificate Request Functionality", () async {
      await testMarraigeCertificates(client);
    });

    test("Create MarriageCertificate Request", () async {
      await testCreateMarriageCertificate(client);
    });
    
    test("Verify MarriageCertificate Request", () async {
      await testVerifyMarriageCertificate(adminClient);
    });
  });
}

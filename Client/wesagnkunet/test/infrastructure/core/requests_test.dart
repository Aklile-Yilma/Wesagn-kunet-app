import 'package:flutter_test/flutter_test.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';
import 'package:wesagnkunet/infrastructure/core/requests.dart';
import 'package:wesagnkunet/Config.dart' as config;

int EXPECTED_LENGTH = 1;

String EXPECTED_WIFE_NAME = "Najwa";
String TOKEN = "38c28b019bf88949a0dc86cc88ce1c5a172042b4";

testMarraigeCertificates(ApiClient client) async {
  List<MarriageCertificate> certificates =
      await client.execute(GetMarriageCertificatesRequest());

  expect(certificates.length, EXPECTED_LENGTH);
  expect(certificates[0].wife.firstName, EXPECTED_WIFE_NAME);
}

void main() {
  ApiClient client =
      ApiClient(config.API_HOST, baseUrl: config.API_PATH, token: TOKEN);

  group("Core Requests Tests", () {
    test("Marriage Certificate Request Functionality", () async {
      await testMarraigeCertificates(client);
    });
  });
}

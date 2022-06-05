import 'dart:developer';

import 'package:wesagnkunet/infrastructure/auth/AccountManager.dart';
import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';
import 'package:wesagnkunet/Config.dart' as config;

import 'package:wesagnkunet/infrastructure/core/repositories.dart';

class CoreInfrastractureProvider {
  static ApiClient? cleanApiClient;
  static ApiClient? authenticatedApiClient;

  static MarriageCertificateRepository? marriageCertificateRepository;
  static BirthCertificateRepository? birthCertificateRepository;
  static DeathCertificateRepository? deathCertificateRepository;

  static ApiClient provideCleanApiClient() {
    cleanApiClient ??= ApiClient(config.API_HOST, baseUrl: config.API_PATH);
    return cleanApiClient!;
  }

  static Future<ApiClient> provideAuthenticatedApiClient() async {
    if (authenticatedApiClient == null) {
      String? token = await AccountManager.getToken();
      if (token == null) {
        throw Exception("Token not found");
      }
      log("Token: $token");
      authenticatedApiClient =
          ApiClient(config.API_HOST, baseUrl: config.API_PATH, token: token);
    }

    return authenticatedApiClient!;
  }

  static Future<MarriageCertificateRepository>
      provideMarriageCertificateRepository() async {
    marriageCertificateRepository ??=
        MarriageCertificateRepository(await provideAuthenticatedApiClient());
    return marriageCertificateRepository!;
  }

  static Future<BirthCertificateRepository>
      provideBirthCertificateRepository() async {
    birthCertificateRepository ??=
        BirthCertificateRepository(await provideAuthenticatedApiClient());
    return birthCertificateRepository!;
  }

  static Future<DeathCertificateRepository>
      provideDeathCertificateRepository() async {
    deathCertificateRepository ??=
        DeathCertificateRepository(await provideAuthenticatedApiClient());
    return deathCertificateRepository!;
  }
}

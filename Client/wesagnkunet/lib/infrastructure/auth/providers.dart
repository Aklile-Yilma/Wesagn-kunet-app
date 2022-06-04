

import 'package:wesagnkunet/infrastructure/auth/AccountManager.dart';
import 'package:wesagnkunet/infrastructure/auth/repositories.dart';
import 'package:wesagnkunet/infrastructure/core/providers.dart';

class AuthInfrastractureProvider{

	static AuthRepository? authRepository;

  static AuthenticatedAuthRepository? authenticatedAuthRepository;

	static AuthRepository provideAuthRepository(){
		authRepository ??= AuthRepository(CoreInfrastractureProvider.provideCleanApiClient());
		return authRepository!;
	}

  static Future<AuthenticatedAuthRepository> provideAuthenticatedRepository() async{
    authenticatedAuthRepository ??= AuthenticatedAuthRepository(await CoreInfrastractureProvider.provideAuthenticatedApiClient());
    return authenticatedAuthRepository!;
  }







}
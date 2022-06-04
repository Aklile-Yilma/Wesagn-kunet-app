

import 'package:wesagnkunet/infrastructure/auth/AccountManager.dart';
import 'package:wesagnkunet/infrastructure/auth/repsitories.dart';
import 'package:wesagnkunet/infrastructure/core/providers.dart';

class AuthInfrastractureProvider{

	static AuthRepository? authRepository;

	static AuthRepository provideAuthRepository(){
		authRepository ??= AuthRepository(CoreInfrastractureProvider.provideCleanApiClient());
		return authRepository!;
	}




}
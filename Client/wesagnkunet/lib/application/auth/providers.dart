


import 'package:wesagnkunet/application/auth/login/bloc.dart';
import 'package:wesagnkunet/infrastructure/auth/providers.dart';

class AuthApplicationProviders{

  
  static LoginBloc provideLoginBloc(){
    return LoginBloc(AuthInfrastractureProvider.provideAuthRepository());
  }

}
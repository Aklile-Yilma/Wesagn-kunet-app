


import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/auth/token.dart';

class SignupResponse{

  JWTToken token;

  Client client;

  SignupResponse(this.token, this.client);

}
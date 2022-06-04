


import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/auth/signup_response.dart';
import 'package:wesagnkunet/infrastructure/auth/AccountManager.dart';
import 'package:wesagnkunet/infrastructure/auth/requests.dart';
import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';


class AuthRepository{


	ApiClient apiClient;

  AuthRepository(this.apiClient);

	login(String username, String password) async{
		String token = await apiClient.execute(LoginRequest(username, password));
    await AccountManager.setToken(token);
	}

  Future<Client> signup(Client client) async{
    SignupResponse response = await apiClient.execute(SignupRequest(client));
    await AccountManager.setToken(response.token);
    return response.client;
  }

}
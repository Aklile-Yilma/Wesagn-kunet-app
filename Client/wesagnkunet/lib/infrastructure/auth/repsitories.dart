


import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/auth/signup_response.dart';
import 'package:wesagnkunet/domain/auth/token.dart';
import 'package:wesagnkunet/infrastructure/auth/AccountManager.dart';
import 'package:wesagnkunet/infrastructure/auth/requests.dart';
import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';
import 'package:wesagnkunet/infrastructure/lib/repository.dart';


class AuthRepository{


	ApiClient apiClient;

  AuthRepository(this.apiClient);

	login(String username, String password) async{
		JWTToken token = await apiClient.execute(LoginRequest(username, password));
    await AccountManager.setToken(token);
	}

  Future<Client> signup(Client client) async{
    SignupResponse response = await apiClient.execute(SignupRequest(client));
    await AccountManager.setToken(response.token);
    return response.client;
  }

}


class GetMyAccountRepositoryCall extends RepositoryCall<void, Client>{
  

  ApiClient apiClient;

  GetMyAccountRepositoryCall(this.apiClient);


  @override
  Future<Client?> getCached(void input) async{
    return null;
  }

  @override
  Future<Client> networkCall(void input) async{
    return await apiClient.execute(GetMyAccountRequest());
  }

  @override
  void storeCache(Client value) {
    // TODO: implement storeCache
  }

}


class AuthenticatedAuthRepository{

  ApiClient apiClient;

  AuthenticatedAuthRepository(this.apiClient);


  Future<Client> getMyAccount() async{

    return GetMyAccountRepositoryCall(apiClient).get(null);

  }

}

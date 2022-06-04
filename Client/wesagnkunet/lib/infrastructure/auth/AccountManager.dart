import 'package:shared_preferences/shared_preferences.dart';


class AccountManager{

	static const String tokenKey = "lib.auth.data.AccountManager.Token";


	static setToken(String token) async{
		
		SharedPreferences prefs = await SharedPreferences.getInstance();
		prefs.setString(
			tokenKey,
			token
		);

	}

	static Future<String?> getToken() async{

		SharedPreferences prefs = await SharedPreferences.getInstance();
		return prefs.getString(tokenKey);
    

	}

}
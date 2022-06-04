import 'package:shared_preferences/shared_preferences.dart';
import 'package:wesagnkunet/domain/auth/token.dart';


class AccountManager{

	static const String tokenKey = "WesagnKunet.lib.auth.data.AccountManager.Token";
  static const String refreshPrefix = ".Refresh";
  static const String accessPrefix = ".Access";


	static setToken(JWTToken token) async{
		
		SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(
      "$tokenKey$refreshPrefix",
      token.refresh
    );

    prefs.setString(
      "$tokenKey$accessPrefix",
      token.access
    );

	}

	static Future<String?> getToken() async{

		SharedPreferences prefs = await SharedPreferences.getInstance();
		return prefs.getString("$tokenKey$refreshPrefix");
    

	}

}
import 'package:shared_preferences/shared_preferences.dart';


class AccountManager{

	static const String accountPrefix = "lib.auth.data.AccountManager.Username";


	static void addToken(String username, String token) async{
		
		SharedPreferences prefs = await SharedPreferences.getInstance();
		prefs.setString(
			"$accountPrefix.$username",
			token
		);

	}

	static void getToken(String username) async{

		SharedPreferences prefs = await SharedPreferences.getInstance();
		prefs.getString("$accountPrefix}.$username");

	}

}
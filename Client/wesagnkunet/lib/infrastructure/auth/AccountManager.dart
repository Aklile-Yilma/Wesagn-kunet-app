import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wesagnkunet/domain/auth/token.dart';
import 'package:wesagnkunet/Config.dart' as config;


class AccountManager{

	static const String tokenKey = "WesagnKunet.lib.auth.data.AccountManager.Token";
  static const String refreshPrefix = ".Refresh";
  static const String accessPrefix = ".Access";
  static const String sessionPrefix = ".SessionID";


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

    prefs.setString(
        "$tokenKey$sessionPrefix",
        generateSessionId()
    );


	}

  static String generateSessionId(){

    var random = Random();
    return String.fromCharCodes(
      List.generate(config.SESSION_ID_LEN, (index) => random.nextInt(33)+89)
    );

  }

	static Future<String?> getToken() async{

		SharedPreferences prefs = await SharedPreferences.getInstance();
		return prefs.getString("$tokenKey$accessPrefix");
    
	}

  static Future<String?> getSessionID() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
		return prefs.getString("$tokenKey$sessionPrefix");

  }

  static discardToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("$tokenKey$refreshPrefix");
    prefs.remove("$tokenKey$accessPrefix");
    prefs.remove("$tokenKey$sessionPrefix");
  }

}
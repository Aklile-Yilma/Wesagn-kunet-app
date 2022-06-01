


import 'dart:convert';

import 'package:wesagnkunet/infrastructure/core/network/Request.dart';


class LoginRequest extends Request<String>{

  LoginRequest(username, password): super(
                                        "/auth/login/",
                                        method: Method.post,
                                        postParams: {
                                          "username": username,
                                          "password": password
                                        }
                                       );

  @override
  String deserializeObject(response) {
    return jsonDecode(response)["key"];
  }

}
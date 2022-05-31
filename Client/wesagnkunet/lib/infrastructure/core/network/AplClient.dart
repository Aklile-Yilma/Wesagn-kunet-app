import 'package:http/http.dart' as http;

import 'package:wesagnkunet/infrastructure/core/network/Request.dart';
import 'package:wesagnkunet/Config.dart' as config;


class ApiClient {

	String? _token;
  String baseUrl;


	ApiClient(this.baseUrl, {token}){
		_token = token;
  }

  Uri _getCompleteUrl(url, {params}){
    if(params == null) {
      return Uri.http(baseUrl, url);
    }
    return Uri.http(baseUrl, url, params);
  }

  Map<String, String> _getCompleteHeader(Map<String, String> header){
    if(_token != null) {
      header[config.AUTHORIZATION_KEY] = "${config.AUTHORIZATION_PREFIX} $_token";
    }
    return header;
  }

  Future<http.Response> _get(Request request, Map<String, String> headers) async{
    return http.get(
      _getCompleteUrl(request.getUrl(), params: request.getGetParams()),
      headers: headers
    );
  }

  Future<http.Response> _post(Request request, Map<String, String> headers) async{
    return http.post(
      _getCompleteUrl(request.getUrl()),
      body: request.getPostData(),
      headers: headers
    );
  }

  Future<T?> execute<T>(Request<T> request) async{

    Map<String, String> headers = _getCompleteHeader(request.getHeaders());

    http.Response response;

    switch(request.getMethod()){

      case Method.get:
        response = await _get(request, headers);
        break;
      
      case Method.post:
        response = await _post(request, headers);
        break;
  
    }

    if(response.statusCode >=400){
      throw ApiException();
    }

    return request.deserializeObject(response.body);

  }

}


class ApiException implements Exception{

  @override
  String toString() {
    return "ApiException";
  }

}
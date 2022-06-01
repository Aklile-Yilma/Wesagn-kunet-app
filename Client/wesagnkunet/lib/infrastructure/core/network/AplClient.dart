import 'package:http/http.dart' as http;

import 'package:wesagnkunet/infrastructure/core/network/Request.dart';
import 'package:wesagnkunet/Config.dart' as config;

class ApiClient {
<<<<<<< HEAD

	String? _token;
  String host;
  String baseUrl = "";


	ApiClient(this.host, {token, baseUrl}){
		_token = token;
    if(baseUrl != null){
      this.baseUrl = baseUrl;
    }
  }

  Uri _getCompleteUrl(String path, {params}){
    path = "$baseUrl/$path".replaceAll("//", "/");
    if(params == null) {
      return  Uri.http(host, path);
=======
  String? _token;
  String baseUrl;

  ApiClient(this.baseUrl, {token}) {
    _token = token;
  }

  Uri _getCompleteUrl(url, {params}) {
    if (params == null) {
      return Uri.http(baseUrl, url);
>>>>>>> 430a6ba7c6987fa514cb6fe511e60054ab3efb5a
    }
    return Uri.http(host, path, params);
  }

  Map<String, String> _getCompleteHeader(Map<String, String> header) {
    if (_token != null) {
      header[config.AUTHORIZATION_KEY] =
          "${config.AUTHORIZATION_PREFIX} $_token";
    }
    return header;
  }

  Future<http.Response> _get(
      Request request, Map<String, String> headers) async {
    return http.get(
        _getCompleteUrl(request.getUrl(), params: request.getGetParams()),
        headers: headers);
  }

<<<<<<< HEAD
  Future<http.Response> _post(Request request, Map<String, String> headers) async{
    return http.post(
       _getCompleteUrl(request.getUrl()),
      body: request.getPostData(),
      headers: headers
    );
  }

  Future<T> execute<T>(Request<T> request) async{

=======
  Future<http.Response> _post(
      Request request, Map<String, String> headers) async {
    return http.post(_getCompleteUrl(request.getUrl()),
        body: request.getPostData(), headers: headers);
  }

  Future<T?> execute<T>(Request<T> request) async {
>>>>>>> 430a6ba7c6987fa514cb6fe511e60054ab3efb5a
    Map<String, String> headers = _getCompleteHeader(request.getHeaders());

    http.Response response;

    switch (request.getMethod()) {
      case Method.get:
        response = await _get(request, headers);
        break;

      case Method.post:
        response = await _post(request, headers);
        break;
    }

<<<<<<< HEAD
    if(response.statusCode >=400){
      throw ApiException(response.statusCode, response: response);
=======
    if (response.statusCode >= 400) {
      throw ApiException();
>>>>>>> 430a6ba7c6987fa514cb6fe511e60054ab3efb5a
    }

    return request.deserializeObject(response.body);
  }
}

<<<<<<< HEAD

class ApiException implements Exception{

  int statusCode;
  http.Response? response;


  ApiException(this.statusCode, {this.response});

=======
class ApiException implements Exception {
>>>>>>> 430a6ba7c6987fa514cb6fe511e60054ab3efb5a
  @override
  String toString() {
    return "ApiException";
  }
}

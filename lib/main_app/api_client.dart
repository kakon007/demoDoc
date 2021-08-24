import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

enum ApiUrlType {
  login,
  signUp,
}

class ApiClient {
  http.Client httClient = http.Client();

  Future<http.Response> getRequest(String url) async {
    var completeUrl = _buildUrl(url);
    var headers = await _getHeaders();
    return httClient.get(Uri.parse(completeUrl), headers: headers);
  }

  Future<http.Response> postRequest(String url, Map<String, dynamic> body,
      {Duration timeout}) async {
    var completeUrl = _buildUrl(url);
    var headers = await _getHeaders();
    var encodedBody = json.encode(body);
    return httClient
        .post(Uri.parse(completeUrl), headers: headers, body: encodedBody)
        .timeout(Duration(seconds: 15));
  }

  Future<http.Response> putRequest(String url, Map<String, dynamic> body,
      {Duration timeout}) async {
    var completeUrl = _buildUrl(url);
    var headers = await _getHeaders();
    var encodedBody = json.encode(body);
    return httClient.put(Uri.parse(completeUrl),
        headers: headers, body: encodedBody);

//    return httClient.put(completeUrl, headers: headers, body: encodedBody);
  }

  Future<Map<String, String>> _getHeaders() async {
    var accessToken = await AccessTokenProvider().getToken();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (accessToken != null)
      headers.addAll({HttpHeaders.authorizationHeader: "Bearer $accessToken"});
    return headers;
  }
  Future<Map<String, String>> _getHeaderFormData() async {
    var token = await AccessTokenProvider().getToken();
    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
    };

    if (token != null) headers.addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
    return headers;
  }
  _buildUrl(String partialUrl) {
    String baseUrl = Urls.baseUrl;
    return baseUrl + partialUrl;
  }
}

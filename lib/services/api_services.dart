import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_1/services/api_urls.dart';

class ApiService {
  ApiService._();
  static final ApiService _instance = ApiService._();
  static ApiService get instance => _instance;

  Future<http.Response> loginUser(String email, String password) async {
    final url = Uri.parse(ApiUrls.login);
    Map<String, dynamic> requestBody = {
      "email": email,
      "domain": "myCompany.com",
      "password": password,
      "screenType": [],
      "responseFormat": []
    };
    final headers = {
      'Cache-Control': 'no-cache',
      'Postman-Token': '<calculated when request is sent>',
      'Content-Type': 'application/json',
      'Host': '<calculated when request is sent>',
      'User-Agent': 'PostmanRuntime/7.37.0',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };
    final body = jsonEncode(requestBody);
    print(body);
    final response = await http.post(url, body: body, headers: headers);
    print(response);
    print(response.statusCode);
    return response;
  }
}

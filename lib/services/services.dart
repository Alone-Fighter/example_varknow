import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;


class Services {
  String baseUrl = 'https://b8e77385-3c9e-475d-9825-4249c5cf7b64.mock.pstmn.io';
  final headers = <String, String>{
    'Content-Type': 'application/json',
  };

  Future signup(var jsonBody) async {
    final response = await http.post(Uri.parse('$baseUrl/signup'),body: jsonBody,headers: headers);
    log(response.body);
    var responseBody = json.decode(response.body);
    log(responseBody['res']);
    return responseBody;
  }

  Future verifyCode(String number) async {
    final response = await http.get(Uri.parse('$baseUrl/verifycode?number=$number'),);
    log(response.body);
    var responseBody = json.decode(response.body);
    log(responseBody['res']);
    return responseBody;
  }



}

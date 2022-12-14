
import 'dart:convert';
import 'package:grouptravel/services/app_toast.dart';
import 'package:grouptravel/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final JsonDecoder _decoder = const JsonDecoder();

Future httpRequest(endPoint, [body, method = "GET"]) async {

  final apiURL = dotenv.env['API_URL'];
  final url = apiURL! + endPoint;

  var client = http.Client();
  print('[]');
  final auth = await AuthService.getAuth();

  final headers = <String, String> {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': endPoint == "/social-login" ? '' : 'Bearer ' + auth["access_token"]
  };

  try {

    http.Response response;
    if(method == 'GET') {
      response = await client.get(Uri.parse(url), headers: headers);
    }else {
      response = await client.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
    }

    final int statusCode = response.statusCode;
    appToast(jsonEncode(response.body).toString());

    if (statusCode < 200 || statusCode > 400) {
      return {
        "code": statusCode,
        "status": false,
        "error": ""
      };
    }
    final String res = response.body;
    return {
      "code": statusCode,
      "status": true,
      ..._decoder.convert(res)
    };

    return res;

  } finally {
    client.close();
  }
}
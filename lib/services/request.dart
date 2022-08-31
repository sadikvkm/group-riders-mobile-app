
import 'dart:convert';
import 'package:grouptravel/services/app_toast.dart';
import 'package:grouptravel/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final JsonDecoder _decoder = const JsonDecoder();

Future httpRequest(endPoint, body) async {
  final apiURL = dotenv.env['API_URL'];
  final url = apiURL! + endPoint;

  var client = http.Client();
  final auth = await AuthService.getAuth();

  try {
    var response = await client.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': endPoint == "/social-login" ? '' : 'Bearer ' + auth["access_token"]
        },
        body: jsonEncode(body)
    );

    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
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
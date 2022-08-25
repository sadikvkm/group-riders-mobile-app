
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final JsonDecoder _decoder = new JsonDecoder();

Future httpRequest(endPoint, body) async {
  final apiURL = dotenv.env['API_URL'];
  final url = apiURL! + endPoint;
  print(apiURL);
  var client = http.Client();
  try {
    var response = await client.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
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
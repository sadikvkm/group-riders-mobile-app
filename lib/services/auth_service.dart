

import 'dart:convert';

import 'package:grouptravel/services/shared_data.dart';

class AuthService {


  static void attemptLogin(String authData) async {
    SharedData.set('auth', authData);
  }

  static Future getAuth() async {
    final authData = await SharedData.get('auth');
    return jsonDecode(authData);
  }

}
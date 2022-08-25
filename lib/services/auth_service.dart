

import 'package:grouptravel/services/shared_data.dart';

class AuthService {


  static void attemptLogin(String authData) async {
    SharedData.set('auth', authData);
  }

  static getAuth() async {
    final authData = await SharedData.get('auth');
    if(! authData) {
      return {
        "status": false,
        "error": "Unauthorized"
      };
    }

    return authData;
  }

}
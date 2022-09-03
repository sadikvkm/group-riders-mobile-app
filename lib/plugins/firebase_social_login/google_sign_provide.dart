
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grouptravel/plugins/firebase_social_login/social_login_model.dart';
import 'package:grouptravel/services/app_toast.dart';
import 'package:grouptravel/services/request.dart';

class GoogleSingInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _currentUser;
  GoogleSignInAccount? get currentUser => _currentUser!;

  Future googleLogin<SocialLoginModel>() async {

    final googleUser = await googleSignIn.signIn();
    if(googleUser == null) return;
    _currentUser = googleUser;
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    final user = await FirebaseAuth.instance.currentUser;
    final token = await user?.getIdToken();
    if(googleAuth.accessToken != null || googleAuth.idToken != null) {

      final response = await httpRequest('/social-login', {
        "token": token.toString()
      }, 'POST');

      return response;
    };
    notifyListeners();
    return true;
  }
}
import 'dart:convert';
import 'dart:developer';

import 'package:grouptravel/modules/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:grouptravel/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'google_sign_provide.dart';

class GoogleSignInButton extends StatefulWidget {

  const GoogleSignInButton({
    Key? key,
    required this.onSuccess
  }) : super(key: key);

  final Function onSuccess;

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {

  void onButtonTapped() {

    Dashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        onPressed: () async {

          final provider = Provider.of<GoogleSingInProvider>(context, listen: false);

          final data = await provider.googleLogin();

          if (data != null) {
            if(data['code'] == 200) {
              AuthService.attemptLogin(jsonEncode(data['result']));
              widget.onSuccess();
            }
          } else {
            log('Google Sign In Failed');
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(
                image: AssetImage("assets/images/google.png"),
                height: 35.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

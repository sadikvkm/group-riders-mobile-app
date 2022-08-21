import 'package:grouptravel/widget/page_container.dart';
import 'package:flutter/material.dart';
import 'package:grouptravel/plugins/firebase_social_login/firebase_social_login.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageContainer(
    showAppBar: false,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 20.0,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/app_logo.png',
                          height: 160,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
              ),
              GoogleSignInButton()
            ]
        )
      )
    );
  }
}
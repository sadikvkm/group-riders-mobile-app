import 'package:flutter/material.dart';

AppLoader(BuildContext context) {

  AlertDialog alert = const AlertDialog(

    content: Text("Please wait..."),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
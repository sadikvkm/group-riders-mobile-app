import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({
    Key? key,
    required this.child,
    this.showAppBar: true,
    this.appbarName: "Title",
    this.statusBarColor: Colors.blue,
    this.backgroundColor: Colors.white,
    this.bottomNavigationColor: Colors.black,
    this.statusBarIconBrightness: Brightness.dark,
    this.floatingActionButton,
    this.appbarActions
  }) : super(key: key);

  final Widget child;
  final String appbarName;
  final bool showAppBar;
  final Color statusBarColor;
  final Color backgroundColor;
  final Color bottomNavigationColor;
  final Brightness statusBarIconBrightness;
  final Widget? floatingActionButton;
  final dynamic appbarActions;


  @override
  Widget build (BuildContext ctxt) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: statusBarColor
    ));
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: showAppBar ? AppBar(
          title: Text(appbarName),
          actions: appbarActions,
      ) : null,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: child,
        ),
      ),
        floatingActionButton: floatingActionButton ,
    );
    return SafeArea(
      child: child,
    );
  }
}
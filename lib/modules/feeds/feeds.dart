import 'package:grouptravel/widget/page_container.dart';
import 'package:flutter/material.dart';

class Feeds extends StatelessWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const PageContainer(
      showAppBar: false,
      child: Center(
        child: Text('Coming soon...'),
      ),
    );
  }
}
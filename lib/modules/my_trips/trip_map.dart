import 'package:flutter/services.dart';
import 'package:grouptravel/widget/page_container.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import '../../plugins/google_map/map.dart';

class TripMap extends StatelessWidget {
  const TripMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: TripMapView(),
    );
  }
}
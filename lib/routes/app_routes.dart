import 'package:grouptravel/modules/auth/auth.dart';
import 'package:grouptravel/modules/dashboard/dashboard.dart';
import 'package:grouptravel/modules/my_trips/trip_map.dart';
import 'package:flutter/material.dart';

var appRoutes = <String, WidgetBuilder>{
  '/': (context) => const Auth(),
  '/dashboard': (context) => Dashboard(),
  '/trip_map': (context) => const TripMap(),
};
import 'package:grouptravel/modules/auth/auth.dart';
import 'package:grouptravel/modules/dashboard/dashboard.dart';
import 'package:grouptravel/modules/my_trips/new_trip.dart';
import 'package:grouptravel/modules/my_trips/trip_map.dart';
import 'package:flutter/material.dart';

var appRoutes = <String, WidgetBuilder>{
  '/login': (context) => const Auth(),
  '/': (context) => const Auth(),
  '/dashboard': (context) => Dashboard(),
  '/trip_map': (context) => const TripMap(),
  '/new_trip': (context) => NewTrip(),
};
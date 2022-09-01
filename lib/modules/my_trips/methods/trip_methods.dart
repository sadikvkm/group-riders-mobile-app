import 'package:flutter/material.dart';
import 'package:grouptravel/modules/my_trips/models/trip_list_model.dart';
import 'package:grouptravel/services/request.dart';

Future createTrip(data) async {
  final result = await await httpRequest('/trips', data, 'POST');
  return result;
}

Future getAllTrips() async {
  final result = await httpRequest('/trips');
  return result;
}
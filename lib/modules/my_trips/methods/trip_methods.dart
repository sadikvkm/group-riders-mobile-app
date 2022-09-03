import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grouptravel/modules/my_trips/models/Job.dart';
import 'package:grouptravel/services/request.dart';
import 'package:http/http.dart' as http;

Future createTrip(data) async {
  final result = await httpRequest('/trips', data, 'POST');
  return result;
}

Future<List<TripList>> getAllTrips() async {
  final response = await httpRequest('/trips');

  if (response['code'] == 200) {
    List jsonResponse = response['result'];
    print(jsonResponse);
    return jsonResponse.map((trip) => TripList.fromJson(trip)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
  // final result = await httpRequest('/trips');
  return response;
}
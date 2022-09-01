import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grouptravel/modules/my_trips/models/Job.dart';
import 'package:grouptravel/services/request.dart';
import 'package:http/http.dart' as http;

Future createTrip(data) async {
  final result = await await httpRequest('/trips', data, 'POST');
  return result;
}

Future<List<Job>> getAllTrips() async {
  const jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
  final response = await http.get(Uri.parse(jobsListAPIUrl));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => Job.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
  final result = await httpRequest('/trips');
  return result;
}
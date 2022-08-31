import 'package:flutter/material.dart';
import 'package:grouptravel/services/request.dart';

Future createTrip(data) async {

  final result = await await httpRequest('/trips', data);
  return result;
}
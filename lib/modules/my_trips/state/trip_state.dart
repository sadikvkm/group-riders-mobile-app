import 'package:flutter/material.dart';

class TripState extends ChangeNotifier {

  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    print('dddd');
    notifyListeners();
  }
}

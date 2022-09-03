import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TripMapView extends StatefulWidget {
  const TripMapView({Key? key}) : super(key: key);

  @override
  State<TripMapView> createState() => MapSampleState();
}

class MapSampleState extends State<TripMapView> {
  final LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  late GoogleMapController _controller;
  final Location _location = Location();

  void _onMapCreated(GoogleMapController cntlr)
  {
    _controller = cntlr;
    _location.onLocationChanged.listen(<LocationData>(l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(l.latitude, l.longitude),
              zoom: 15
          ),
        ),
      );
      //
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: _initialcameraposition),
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()  {},
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      )
    );
  }
}
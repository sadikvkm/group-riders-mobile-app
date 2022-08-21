import 'dart:developer';

import 'package:grouptravel/modules/my_trips/trip_map.dart';
import 'package:grouptravel/widget/page_container.dart';
import 'package:flutter/material.dart';

class MyTrips extends StatelessWidget {
  const MyTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageContainer(
      showAppBar: false,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TripMap()));
              },
              child: Column(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.flight),
                    title: Text('Trip to Paris'),
                    subtitle: Text('Departure: 12/12/2019'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
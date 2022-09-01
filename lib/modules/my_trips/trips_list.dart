import 'dart:developer';

import 'package:grouptravel/modules/my_trips/models/trip_list_model.dart';
import 'package:grouptravel/modules/my_trips/new_trip.dart';
import 'package:grouptravel/modules/my_trips/trip_map.dart';
import 'package:grouptravel/widget/page_container.dart';
import 'package:flutter/material.dart';

import 'methods/trip_methods.dart';

class MyTrips extends StatefulWidget {
  const MyTrips({Key? key}) : super(key: key);
  MyTripsState createState() => MyTripsState();
}

class MyTripsState extends State<MyTrips> {

  List<TripListModel> _newsArticles = <TripListModel>[];

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  void fetchInitialData() async {

    final d = await getAllTrips();
    _newsArticles = d['result'];

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageContainer(
      showAppBar: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewTrip()));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      child: ListView.builder(
        itemCount: _newsArticles.length,
        itemBuilder: (context, index) {
          return Card(

            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TripMap()));
              },
              child: Column(
                children: <Widget>[
                  Text('$_newsArticles'),
                  const ListTile(
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
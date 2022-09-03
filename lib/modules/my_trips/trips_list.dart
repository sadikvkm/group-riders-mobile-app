import 'dart:convert';
import 'dart:developer';

import 'package:grouptravel/modules/my_trips/models/Job.dart';
import 'package:grouptravel/modules/my_trips/new_trip.dart';
import 'package:grouptravel/modules/my_trips/trip_map.dart';
import 'package:grouptravel/utilities/helpers.dart';
import 'package:grouptravel/widget/page_container.dart';
import 'package:flutter/material.dart';

import 'methods/trip_methods.dart';

class MyTrips extends StatefulWidget {
  const MyTrips({Key? key}) : super(key: key);
  MyTripsState createState() => MyTripsState();
}

class MyTripsState extends State<MyTrips> {

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
      child: FutureBuilder<List<TripList>>(
        future: getAllTrips(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TripList>? data = snapshot.data;
            return _jobsListView(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}


ListView _jobsListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TripMap()));
            },
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.flight),
                  title: Text(textCapitalize(data[index].name)),
                  subtitle: Text(data[index].tripNumber),
                ),
              ],
            ),
          ),
        );
      });
}
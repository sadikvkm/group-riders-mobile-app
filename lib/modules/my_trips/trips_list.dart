import 'dart:convert';
import 'dart:developer';

import 'package:grouptravel/modules/my_trips/models/Job.dart';
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
      child: FutureBuilder<List<Job>>(
        future: getAllTrips(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Job>? data = snapshot.data;
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
        return _tile(data[index].position, data[index].company, Icons.work);
      });
}

ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
  title: Text(title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      )),
  subtitle: Text(subtitle),
  leading: Icon(
    icon,
    color: Colors.blue[500],
  ),
);

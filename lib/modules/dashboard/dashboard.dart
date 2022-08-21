import 'package:grouptravel/modules/auth/auth.dart';
import 'package:grouptravel/modules/feeds/feeds.dart';
import 'package:grouptravel/modules/my_trips/trips_list.dart';
import 'package:grouptravel/widget/page_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.blue,
    ));
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Feeds',
                ),
                Tab(
                  text: 'My Trips',
                ),
              ],
            ),
            title: Text('Dashboard'),
          ),
          body: const TabBarView(
            children: [
              MyTrips(),
              Feeds(),
            ],
          ),
        ),
      ),
    );
  }
}
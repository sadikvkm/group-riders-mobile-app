import 'package:grouptravel/modules/my_trips/forms/new_trip_form.dart';
import 'package:grouptravel/modules/my_trips/trip_map.dart';
import 'package:grouptravel/widget/page_container.dart';
import 'package:flutter/material.dart';

GlobalKey<NewTripFormWidget> globalKey = GlobalKey();

class NewTrip extends StatelessWidget {
  const NewTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageContainer(
        showAppBar: true,
        appbarName: "New trip",
        appbarActions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
              onTap: () async {
                globalKey.currentState?.submit(context);
              },
              child: const Icon(
                Icons.check,
                size: 26.0,
              )
            )
          )
        ],
        child: NewTripForm(key: globalKey),
    );
  }
}
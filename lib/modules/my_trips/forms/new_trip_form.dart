import 'package:grouptravel/modules/my_trips/methods/trip_methods.dart';
import 'package:grouptravel/modules/my_trips/trip_map.dart';
import 'package:grouptravel/widget/app_text_box.dart';
import 'package:grouptravel/widget/page_container.dart';
import 'package:flutter/material.dart';

class NewTripForm extends StatefulWidget {
  const NewTripForm({required Key? key}) : super(key: key);

  @override
  NewTripFormWidget createState() => NewTripFormWidget();
}

class NewTripFormWidget extends State<NewTripForm> {

  TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void submit (context) async {
    if (_formKey.currentState!.validate()) {
      final result = await createTrip({
        "name": nameController.text
      });
      if(result['status'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TripMap()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return PageContainer(
      showAppBar: false,
      child: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppTextBox(
                controller: nameController,
                hintText: "Enter the trip name",
                labelText: "Trip name",
                validator: (value) {
                  if (value == null || value.isEmpty) return 'The trip name field is required';
                  if (value.length >= 50) return 'The trip name field Should Contain maximum 50 Characters';
                  return null;
                },
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child : const Center(
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      textAlign: TextAlign.center,
                    ),
                  )
              )
            ]
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';

class AddMeasurement extends StatefulWidget {
  AddMeasurement({Key key}) : super(key: key);

  @override
  _AddMeasurementState createState() => _AddMeasurementState();
}

class _AddMeasurementState extends State<AddMeasurement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Measurement'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextFormField(),
            RaisedButton(
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add_photo_alternate,
                  ),
                  Text('Add Photo'),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.save,
                  ),
                  Text('Save'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MeasurementScreen extends StatefulWidget {
  MeasurementScreen({Key key}) : super(key: key);

  @override
  _MeasurementScreenState createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text('Name'),
            Text('About'),
            // TODO Measurements
            
          ],
        ),
      ),
    );
  }
}

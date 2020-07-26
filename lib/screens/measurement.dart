import 'package:flutter/material.dart';

class MeasurementScreen extends StatefulWidget {
  MeasurementScreen({Key key, this.name}) : super(key: key);
  final String name;

  @override
  _MeasurementScreenState createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
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

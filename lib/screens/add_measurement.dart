import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddMeasurement extends StatefulWidget {
  AddMeasurement({Key key}) : super(key: key);

  @override
  _AddMeasurementState createState() => _AddMeasurementState();
}

class _AddMeasurementState extends State<AddMeasurement> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

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
            _image == null ? Text('No image selected.') : Image.file(_image),
            RaisedButton(
              onPressed: () {
                getImage();
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add_photo_alternate,
                  ),
                  Text(_image == null ? 'Add Photo' : "Change Photo"),
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

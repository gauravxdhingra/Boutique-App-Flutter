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

  List<TextEditingController> kameezControllers;
  List<TextEditingController> salwarControllers;
  List<TextEditingController> pantControllers;

  @override
  void initState() {
    super.initState();
    manageTextEditingControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Measurement'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Name"),
                TextFormField(),
                Text("Description"),
                TextFormField(),
                //
                //
                //
                Text(
                  "Kameez",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                for (int i = 0; i < kameezParts.length; i++)
                  BuildInputBox(
                    part: kameezParts[i],
                    controller: kameezControllers[i],
                  ),
                Divider(),
                //
                //
                //
                Text(
                  "Salwar",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                for (int i = 0; i < salwarParts.length; i++)
                  BuildInputBox(
                    part: salwarParts[i],
                    controller: salwarControllers[i],
                  ),
                Divider(),
                //
                //
                //
                Text(
                  "Pant",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                for (int i = 0; i < pantParts.length; i++)
                  BuildInputBox(
                    part: pantParts[i],
                    controller: pantControllers[i],
                  ),
                Divider(),
                //
                //
                //
                _image == null
                    ? Text('No image selected.')
                    : Image.file(_image),
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
        ),
      ),
    );
  }

  manageTextEditingControllers() {
    kameezControllers = [
      lengthKameezController,
      chestKameezController,
      waistKameezController,
      hipKameezController,
      gheraKameezController,
      baajuKameezController,
      baajuMoriKameezController,
      armolKameezController,
      neckFrontKameezController,
      neckBackKameezController,
    ];
    salwarControllers = [
      lengthSalwarController,
      moriSalwarController,
      beltSalwarController,
    ];
    pantControllers = [
      lengthPantController,
      moriPantController,
      kneePantController,
      thighPantController,
      kamarPantController,
      beltPantController,
      chainPantController,
      pocketsPantController
    ];

    for (int i = 0; i < kameezControllers.length; i++) {
      kameezControllers[i] = TextEditingController();
    }

    for (int i = 0; i < salwarControllers.length; i++) {
      salwarControllers[i] = TextEditingController();
    }

    for (int i = 0; i < pantControllers.length; i++) {
      pantControllers[i] = TextEditingController();
    }
  }

  List<String> kameezParts = [
    "Length",
    "Chest",
    "Kamar (Waist)",
    "Hip",
    "Ghera",
    "Baaju",
    "Baaju Ki Mori",
    "Armol",
    "Neck (Front)",
    "Neck (Back)"
  ];

  List<String> salwarParts = [
    "Length",
    "Mori",
    "Belt",
  ];

  List<String> pantParts = [
    "Length",
    "Mori",
    "Knee",
    "Thigh",
    "Kamar (Waist)",
    "Belt",
    "Chain",
    "Pockets"
  ];

  TextEditingController lengthKameezController,
      chestKameezController,
      waistKameezController,
      hipKameezController,
      gheraKameezController,
      baajuKameezController,
      baajuMoriKameezController,
      armolKameezController,
      neckFrontKameezController,
      neckBackKameezController,
      lengthSalwarController,
      moriSalwarController,
      beltSalwarController,
      lengthPantController,
      moriPantController,
      kneePantController,
      thighPantController,
      kamarPantController,
      beltPantController,
      chainPantController,
      pocketsPantController;
}

class BuildInputBox extends StatefulWidget {
  const BuildInputBox({
    Key key,
    this.part,
    this.controller,
  }) : super(key: key);
  final String part;
  final TextEditingController controller;

  @override
  _BuildInputBoxState createState() => _BuildInputBoxState();
}

class _BuildInputBoxState extends State<BuildInputBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(widget.part),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: TextFormField(
            controller: widget.controller,
          ),
        ),
      ],
    );
  }
}

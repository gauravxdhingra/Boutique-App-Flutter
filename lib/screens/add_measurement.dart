import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahil_boutique/models/size_model.dart';

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
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Enter Customer Details"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Name",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: "Description",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    //
                    //
                    //
                    _image == null
                        ? Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Text(
                              'No image selected.',
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Image.file(_image),
                    Container(
                      height: 70,
                      child: RaisedButton(
                        onPressed: () {
                          getImage();
                        },
                        color: Theme.of(context).primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.camera_alt, color: Colors.white),
                            SizedBox(width: 6),
                            Text(
                              _image == null ? 'Add Photo' : "Change Photo",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    //
                    //
                    //
                    Text(
                      "Kameez",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    for (int i = 0; i < pantParts.length; i++)
                      BuildInputBox(
                        part: pantParts[i],
                        controller: pantControllers[i],
                      ),
                    //
                    //
                    //
                    SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                child: Text(
                  'SAVE',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizeModel size;

  final usersRef = Firestore.instance.collection('customers');

  saveInFirebase(String name) async {
    // check if user exists in users collection in database(acc to their id)

    DocumentSnapshot doc = await usersRef.document(name).get();
    // DocumentSnapshot doc = await usersRef.document(user.id).get();
    if (!doc.exists) {
      await usersRef.document(name).setData({
        "lengthKamiz": size.lengthKamiz,
        "chestKamiz": size.chestKamiz,
        "kamarKamiz": size.kamarKamiz,
        "hipKamiz": size.hipKamiz,
        "gheraKamiz": size.gheraKamiz,
        "baajuKamiz": size.baajuKamiz,
        "baajuMoriKamiz": size.baajuMoriKamiz,
        "armolKamiz": size.armolKamiz,
        "neckFrontKamiz": size.neckFrontKamiz,
        "neckBackKamiz": size.neckBackKamiz,
        "lengthSalwar": size.lengthSalwar,
        "moriSalwar": size.moriSalwar,
        "beltSalwar": size.beltSalwar,
        "lengthPant": size.lengthPant,
        "moriPant": size.moriPant,
        "kneePant": size.kneePant,
        "thighPant": size.thighPant,
        "kamarPant": size.kamarPant,
        "beltPant": size.beltPant,
        "chainPant": size.chainPant,
        "pocketsPant": size.pocketsPant,
        "imageUrl": size.imageUrl,
      });
      doc = await usersRef.document(name).get();
    }
    SizeModel sizee = SizeModel.fromDocument(doc);
    print(sizee);
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
  @override
  void dispose() {
    for (int i = 0; i < kameezControllers.length; i++) {
      kameezControllers[i].dispose();
    }

    for (int i = 0; i < salwarControllers.length; i++) {
      salwarControllers[i].dispose();
    }

    for (int i = 0; i < pantControllers.length; i++) {
      pantControllers[i].dispose();
    }
    super.dispose();
  }
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
        // Text(widget.part),
        Container(
          padding: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width - 30,
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              labelText: widget.part,
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

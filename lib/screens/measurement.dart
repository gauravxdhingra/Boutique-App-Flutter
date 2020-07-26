import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sahil_boutique/models/size_model.dart';

class MeasurementScreen extends StatefulWidget {
  MeasurementScreen({Key key, this.name, this.customerData}) : super(key: key);
  final String name;
  final Map<String, SizeModel> customerData;
  @override
  _MeasurementScreenState createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
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

  @override
  void initState() {
    makeList();
    super.initState();
  }

  List<String> kameezPartsSizes = [],
      salwarPartsSizes = [],
      pantPartsSizes = [];

  makeList() {
    kameezPartsSizes = [
      widget.customerData[widget.name].lengthKamiz,
      widget.customerData[widget.name].chestKamiz,
      widget.customerData[widget.name].kamarKamiz,
      widget.customerData[widget.name].hipKamiz,
      widget.customerData[widget.name].gheraKamiz,
      widget.customerData[widget.name].baajuKamiz,
      widget.customerData[widget.name].baajuMoriKamiz,
      widget.customerData[widget.name].armolKamiz,
      widget.customerData[widget.name].neckFrontKamiz,
      widget.customerData[widget.name].neckBackKamiz,
    ];

    salwarPartsSizes = [
      widget.customerData[widget.name].lengthSalwar,
      widget.customerData[widget.name].moriSalwar,
      widget.customerData[widget.name].beltSalwar,
    ];

    pantPartsSizes = [
      widget.customerData[widget.name].lengthPant,
      widget.customerData[widget.name].moriPant,
      widget.customerData[widget.name].kneePant,
      widget.customerData[widget.name].thighPant,
      widget.customerData[widget.name].kamarPant,
      widget.customerData[widget.name].beltPant,
      widget.customerData[widget.name].chainPant,
      widget.customerData[widget.name].pocketsPant,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Measurements"),
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              if (widget.customerData[widget.name].desc != "")
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.customerData[widget.name].desc,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              if (widget.customerData[widget.name].imageUrl != "" &&
                  widget.customerData[widget.name].imageUrl != null)
                CachedNetworkImage(
                  imageUrl: widget.customerData[widget.name].imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              // Image.network(widget.customerData[widget.name].imageUrl),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    "Kameez".toUpperCase(),
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              for (int i = 0; i < kameezParts.length; i++)
                MeasurementDisplay(
                  type: kameezParts[i],
                  text: kameezPartsSizes[i],
                ),
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    "Salwar".toUpperCase(),
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              for (int i = 0; i < salwarParts.length; i++)
                MeasurementDisplay(
                  type: salwarParts[i],
                  text: salwarPartsSizes[i],
                ),
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    "Pant".toUpperCase(),
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              for (int i = 0; i < pantParts.length; i++)
                MeasurementDisplay(
                  type: pantParts[i],
                  text: pantPartsSizes[i],
                ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Row(
            children: <Widget>[
              Icon(Icons.edit),
              SizedBox(width: 10),
              Text("Edit"),
            ],
          )),
    );
  }
}

class MeasurementDisplay extends StatelessWidget {
  const MeasurementDisplay({
    Key key,
    this.type,
    this.text,
  }) : super(key: key);

  final String type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                type,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text == "" ? "--" : text,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

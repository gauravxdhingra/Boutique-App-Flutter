import 'package:flutter/material.dart';
import 'package:sahil_boutique/screens/add_measurement.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sahil Boutique',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Sahil Boutique'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !_isSearch
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(widget.title),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        _isSearch = true;
                      });
                    },
                  ),
                ],
              )
            : Container(
                child: Row(
                  children: <Widget>[
                    // TextFormField(

                    // ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isSearch = false;
                        });
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ],
                ),
              ),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, i) => Container(
            child: Text(i.toString()),
          ),
          itemCount: 10,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddMeasurement()));
        },
        tooltip: 'Increment',
        icon: Icon(Icons.add),
        label: Text('Add New'),
      ),
    );
  }
}

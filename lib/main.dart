import 'package:flutter/material.dart';

import 'screens/add_measurement.dart';
import 'widgets/customer_list.dart';

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
        title: !_isSearch ? Text(widget.title) : TextField(),
        actions: _isSearch
            ? <Widget>[
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearch = false;
                    });
                  },
                  icon: Icon(Icons.clear),
                ),
              ]
            : <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearch = true;
                    });
                  },
                ),
              ],
      ),
      body: CustomerList(),
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

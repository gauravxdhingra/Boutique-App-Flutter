import 'package:flutter/material.dart';

import 'screens/add_measurement.dart';
import 'widgets/customer_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './models/size_model.dart';

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
  bool _isLoading = true;
  final usersRef = Firestore.instance.collection('customers');

  List<String> customers = [];
  Map<String, SizeModel> customerData = {};

  @override
  void initState() {
    // TODO: implement initState
    getCustomers();
    super.initState();
  }

  getCustomers() async {
    QuerySnapshot snapshot = await usersRef.getDocuments();
    List<SizeModel> sizes = [];
    snapshot.documents.forEach((doc) {
      sizes.add(SizeModel.fromDocument(doc));
    });
    print(sizes);
    print(snapshot.documents.map((f) {
      customers.add(f.documentID);
      return f.documentID;
    }));
    for (int i = 0; i < snapshot.documents.length; i++) {
      customerData[customers[i]] = sizes[i];
    }
    print(customerData);
    // snapshot.documents.forEach((doc) {
    //   // customers.add(doc.data.keys.first);
    // });
    print(customers);
    setState(() {
      _isLoading = false;
    });
  }

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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : CustomerList(
              customers: customers,
              customerData: customerData,
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

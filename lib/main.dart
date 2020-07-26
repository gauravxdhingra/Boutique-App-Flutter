import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';

import 'screens/add_measurement.dart';
import 'screens/measurement.dart';
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
  bool _isLoading = true;
  final usersRef = Firestore.instance.collection('customers');

  List<String> customers = [];
  Map<String, SizeModel> customerData = {};
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
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
    customers = [];
    customerData = {};
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
    searchResults = customers;
    setState(() {
      _isLoading = false;
    });
  }

  List<String> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: FloatingSearchBar.builder(
                pinned: true,
                controller: _searchController,
                itemCount: searchResults.length,
                // padding: EdgeInsets.all(0),
                itemBuilder: (context, i) => ListTile(
                  title: Text(
                    searchResults[i],
                    // style:
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MeasurementScreen(
                              name: customers[i],
                              customerData: customerData,
                            )));
                  },
                ),
                leading: Icon(
                  Icons.search,
                  // color:
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                      icon: Icon(
                        Icons.clear,
                        // color:
                      ),
                      onPressed: () {
                        _searchController.clear();
                        searchResults = [];
                        searchResults = customers;
                        setState(() {});
                      }),
                ),
                onChanged: (String value) async {
                  if (value == '') {
                    searchResults = customers;
                  } else
                    searchResults = customers.where((test) {
                      return test.toLowerCase().contains(value.toLowerCase());
                    }).toList();
                  print(searchResults);
                  setState(() {});
                },

                decoration: InputDecoration.collapsed(
                  hintText: "Search",
                ),
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

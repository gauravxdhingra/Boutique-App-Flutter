import 'package:flutter/material.dart';

import '../screens/measurement.dart';
import 'package:sahil_boutique/models/size_model.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({
    Key key,
    this.customers,
    this.customerData,
  }) : super(key: key);

  final List<String> customers;
  final Map<String, SizeModel> customerData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      itemBuilder: (context, i) => Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MeasurementScreen(
                          name: customers[i],
                          customerData: customerData,
                        )));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      customers[i],
                      style: TextStyle(fontSize: 17),
                    ),
                    // Text('Description'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      itemCount: customers.length,
    );
  }
}

import 'package:flutter/material.dart';

import '../screens/measurement.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({
    Key key,
    this.customers,
  }) : super(key: key);

  final List<String> customers;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        itemBuilder: (context, i) => Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MeasurementScreen(
                            name: customers[i],
                          )));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(customers[i]),
                      // Text('Description'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: customers.length,
      ),
    );
  }
}

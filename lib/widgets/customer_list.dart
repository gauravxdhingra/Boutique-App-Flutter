import 'package:flutter/material.dart';
import 'package:sahil_boutique/screens/measurement.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({
    Key key,
  }) : super(key: key);

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
                      builder: (context) => MeasurementScreen()));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Name'),
                      Text('Description'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: 20,
      ),
    );
  }
}

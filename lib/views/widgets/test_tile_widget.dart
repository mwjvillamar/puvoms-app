import 'package:flutter/material.dart';
import 'package:puvoms/models/test_model.dart';

class CustomTile extends StatelessWidget {
  
  final Test? test;
  
  const CustomTile({
    Key? key,
    this.test
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20, 0),
        child: ListTile(
          leading:  const CircleAvatar(
            radius: 25.0,
          ),
          title: Text(test!.driverName),
          subtitle: Text("Plate Number: ${test!.plateNumber} In Queue: ${test!.inQueue} Passenger Count: ${test!.passengerCount}"),
        ),
      ),
    );
  }
}
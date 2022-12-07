import 'package:flutter/material.dart';

class DriverView extends StatefulWidget {
  const DriverView({Key? key}) : super(key: key);

  @override
  State<DriverView> createState() => _DriverViewState();
}

class _DriverViewState extends State<DriverView> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return const Center(
        child: Text(
            "Driver View"
        )
    );
  }
}

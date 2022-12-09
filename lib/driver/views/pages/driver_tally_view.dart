import 'package:flutter/material.dart';

class DriverTallyView extends StatefulWidget {
  const DriverTallyView({Key? key}) : super(key: key);

  @override
  State<DriverTallyView> createState() => _AdminTallyViewState();
}

class _AdminTallyViewState extends State<DriverTallyView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return Center(
      child: Text("DRIVER Payment Summary"),
    );
  }
}
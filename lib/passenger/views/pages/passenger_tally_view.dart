import 'package:flutter/material.dart';

class PassengerTallyView extends StatefulWidget {
  const PassengerTallyView({Key? key}) : super(key: key);

  @override
  State<PassengerTallyView> createState() => _TallyViewState();
}

class _TallyViewState extends State<PassengerTallyView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return Center(
      child: Text("Passenger Payment Summary"),
    );
  }
}
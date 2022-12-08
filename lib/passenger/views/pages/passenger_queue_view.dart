import 'package:flutter/material.dart';

class PassengerQueueView extends StatefulWidget {
  const PassengerQueueView({Key? key}) : super(key: key);

  @override
  State<PassengerQueueView> createState() => _QueueViewState();
}

class _QueueViewState extends State<PassengerQueueView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return const Center(
      child: Text(
          'Passenger Queue page'
      ),
    );
  }
}
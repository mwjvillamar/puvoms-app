import 'package:flutter/material.dart';

class DriverQueueView extends StatefulWidget {
  const DriverQueueView({Key? key}) : super(key: key);

  @override
  State<DriverQueueView> createState() => _QueueViewState();
}

class _QueueViewState extends State<DriverQueueView> {

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
          'DRIVER Queue page'
      ),
    );
  }
}
import 'package:flutter/material.dart';

class QueueView extends StatefulWidget {
  const QueueView({Key? key}) : super(key: key);

  @override
  State<QueueView> createState() => _QueueViewState();
}

class _QueueViewState extends State<QueueView> {

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
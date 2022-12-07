import 'package:flutter/material.dart';

class SummaryView extends StatefulWidget {
  const SummaryView({Key? key}) : super(key: key);

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return const Center(
      child: Text(
        "Summary View"
      )
    );
  }
}

import 'package:flutter/material.dart';

class TallyView extends StatefulWidget {
  const TallyView({Key? key}) : super(key: key);

  @override
  State<TallyView> createState() => _TallyViewState();
}

class _TallyViewState extends State<TallyView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return Container(
      child: const Center(
        child: Text(
            'Tally page'
        ),
      ),
    );
  }
}
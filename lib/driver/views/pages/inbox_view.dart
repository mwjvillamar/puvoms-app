import 'package:flutter/material.dart';

class InboxView extends StatefulWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {

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
            'DRIVER Inbox page'
        ),
      ),
    );
  }
}
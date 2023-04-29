import 'package:flutter/material.dart';
import 'package:puvoms/features/inbox/views/pages/admin_inbox_provider.dart';

class DriverInboxView extends StatefulWidget {
  const DriverInboxView({Key? key}) : super(key: key);

  @override
  State<DriverInboxView> createState() => _DriverInboxViewState();
}

class _DriverInboxViewState extends State<DriverInboxView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return const AdminInboxProvider();
  }
}
import 'package:flutter/material.dart';

class AdminCalendarView extends StatefulWidget {
  const AdminCalendarView({Key? key}) : super(key: key);

  @override
  State<AdminCalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<AdminCalendarView> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return const Center(
        child: Text(
            "Calendar View"
        )
    );
  }
}

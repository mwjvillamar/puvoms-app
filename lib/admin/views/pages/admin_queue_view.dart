import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/models/queue_collection_model.dart';
import 'package:puvoms/passenger/views/pages/passenger_queue_list.dart';
import 'package:puvoms/services/database.dart';

class AdminQueueView extends StatefulWidget {
  const AdminQueueView({Key? key}) : super(key: key);

  @override
  State<AdminQueueView> createState() => _AdminQueueViewState();
}

class _AdminQueueViewState extends State<AdminQueueView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return StreamProvider<List<QueueCollection>>.value(
      initialData: const [],
      value: DatabaseService().queueList,
      child: const Center(
          child: PassengerQueueList()
      ),
    );
  }
}
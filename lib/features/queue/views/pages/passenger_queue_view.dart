import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/features/queue/models/queue_collection_model.dart';
import 'package:puvoms/features/queue/views/pages/passenger_queue_list.dart';
import 'package:puvoms/services/database.dart';

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

    debugPaintSizeEnabled = false;
  
    //TODO: implement build

    return StreamProvider<List<QueueCollection>>.value(
      initialData: const [],
      value: DatabaseService().queueList,
      child: const Center(
        child: PassengerQueueList(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/models/queue_collection_model.dart';
import 'package:puvoms/models/test_model.dart';
import 'package:puvoms/passenger/views/pages/passenger_queue_list.dart';
import 'package:puvoms/services/database.dart';
import 'package:puvoms/widgets/custom_carditem_widget.dart';
import 'package:puvoms/widgets/test_list_widget.dart';

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

    //debugPaintSizeEnabled = true;

    // TODO: implement build

    // return Center(
    //   child: Padding(
    //     padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, 0),
    //     child: ListView(
    //       children: const[
    //         CustomCardItem(),
    //         CustomCardItem(),
    //         CustomCardItem(),
    //         CustomCardItem(),
    //         CustomCardItem(),
    //         CustomCardItem(),
    //       ],
    //     ),
    //   ),
    // );
    return StreamProvider<List<QueueCollection>>.value(
      initialData: const [],
      value: DatabaseService().queueList,
      child: Scaffold(
        body: const Center(
          child: PassengerQueueList()
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            debugPrint(DatabaseService().userData.toString());
          },
        child: const Text('+'),
        ),
      ),
    );
  }
}
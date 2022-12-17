import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/models/queue_collection_model.dart';
import 'package:puvoms/models/vehicle_model.dart';
import 'package:puvoms/services/database.dart';
import 'package:puvoms/widgets/custom_queuecard_widget.dart';

class PassengerQueueList extends StatefulWidget {
  const PassengerQueueList({super.key});

  @override
  State<PassengerQueueList> createState() => _PassengerQueueListState();
}

class _PassengerQueueListState extends State<PassengerQueueList> {
  @override
  Widget build(BuildContext context) {
    
    final queueList = Provider.of<List<QueueCollection>>(context);
    
    // queueList.forEach((queueList){
    //   debugPrint(queueList.uid);
    //   debugPrint(queueList.inQueue.toString());
    //   debugPrint(queueList.queueStart.toString());
    //   debugPrint(queueList.firstName);
    //   debugPrint(queueList.lastName);
    //   debugPrint(queueList.plateNumber);
    //   debugPrint(queueList.passengerCount.toString());
    // });
    
    return StreamBuilder<List<VehicleCollection>>(
      stream: DatabaseService().vehicleList,
      builder: (context, snapshot) {
        List<VehicleCollection>? vehicleList = snapshot.data;
        return ListView.builder(
          padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainWP),
          itemCount: queueList.length,
          itemBuilder: (context, index) {
            // return CustomQueueCard(value: queueList[index], vehicleData: vehicleList?[index],);
            return CustomQueueCard(value: queueList[index], vehicleData: vehicleList?[index]);
          },
        );
      }
    );
  }
}
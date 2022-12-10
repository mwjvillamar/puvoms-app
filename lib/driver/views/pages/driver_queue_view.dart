import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/models/queue_collection_model.dart';
import 'package:puvoms/models/user_collection_model.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/models/vehicle_model.dart';
import 'package:puvoms/services/database.dart';
import 'package:puvoms/widgets/custom_button_widget.dart';

class DriverQueueView extends StatefulWidget {
  const DriverQueueView({Key? key}) : super(key: key);

  @override
  State<DriverQueueView> createState() => _DriverQueueViewState();
}

class _DriverQueueViewState extends State<DriverQueueView> {
  
  bool inQueue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserObject?>(context);
    // debugPrint("Driver QUEUE" + user.toString());
    
    // TODO: implement build

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user!.uid).userData,
      builder: (context, snapshot) {
        UserData? userData = snapshot.data;
        return StreamBuilder<QueueData>(
          stream: DatabaseService(uid: user.uid).queueStatus,
          builder: (context, snapshot2) {
            QueueData? queueStatus = snapshot2.data;
            return StreamBuilder<VehicleData>(
              stream: DatabaseService(uid: user.uid).vehicleData,
              builder: (context, snapshot3) {
                VehicleData? vehicleData = snapshot3.data;
                return Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        key: const ValueKey("queue-driver"),
                        text: "Queue Driver + ${queueStatus?.inQueue}",
                        // value: [user.uid, inQueue, userData?.firstName, userData?.lastName],
                        value: {
                          "uid" : user.uid,
                          "inQueue" : queueStatus?.inQueue,
                          "firstName" : userData?.firstName,
                          "lastName" : userData?.lastName,
                          "plateNumber" : vehicleData?.plateNumber
                        },
                      ),
                    ],
                  ),
                );
              }
            );
          }
        );
      }
    );
  }
}
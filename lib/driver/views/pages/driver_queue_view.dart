import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/models/queue_collection_model.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/models/vehicle_model.dart';
import 'package:puvoms/services/database.dart';
import 'package:puvoms/widgets/custom_button_widget.dart';
import 'package:puvoms/widgets/custom_queueitem_widget.dart';

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
                return StreamBuilder<QueueData>(
                  stream: DatabaseService(uid: user.uid).queueData,
                  builder: (context, snapshot4) {
                    QueueData? queueData = snapshot4.data;
                    return Center(
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Padding(
                              padding:  EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 200,
                                        minWidth: 200,
                                      ),
                                      // decoration: const BoxDecoration(
                                      //   shape: BoxShape.circle,
                                      //   image: DecorationImage(
                                      //     image: AssetImage('lib/assets/puvoms_logo.png'),
                                      //     fit: BoxFit.contain
                                      //   )
                                      child: FittedBox(
                                          child: Icon(Icons.directions_bus)
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: context.mainHP),
                                  CustomButton(
                                    key: const ValueKey("queue-driver"),
                                    text: "Queue Driver + ${queueStatus?.inQueue}",
                                    // value: [user.uid, inQueue, userData?.firstName, userData?.lastName],
                                    value: {
                                      "uid" : user.uid,
                                      "inQueue" : queueStatus?.inQueue,
                                      "firstName" : userData?.firstName,
                                      "lastName" : userData?.lastName,
                                      "plateNumber" : vehicleData?.plateNumber,
                                      "queueTime" : queueData
                                    },
                                  ),
                                  SizedBox(height: context.mainHP),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        if (queueStatus?.inQueue == true) ... [
                                          const CustomQueueItem(icon: Icons.departure_board, text: 'Queue Status', value: "Queued",),
                                        ] else ... [
                                          const CustomQueueItem(icon: Icons.departure_board, text: 'Queue Status', value: "Not Queued",),
                                        ],
                                        CustomQueueItem(icon: Icons.map, text: 'Passengers: ', value:  queueData?.passengerCount.toString(),),
                                        CustomQueueItem(icon: Icons.directions_car, text: 'Model: ', value: vehicleData?.vehicleBrand,),
                                        CustomQueueItem(icon: Icons.color_lens, text: 'Color: ', value: vehicleData?.vehicleColor,),
                                        CustomQueueItem(icon: Icons.numbers, text: 'License No.: ', value: vehicleData?.plateNumber,),
                                        CustomQueueItem(icon: Icons.departure_board, text: 'Queue Start: ', value: queueData?.queueStart.toString(),),
                                        CustomQueueItem(icon: Icons.departure_board, text: 'Estimated Time of Departure: ', value: queueData?.queueStart.toString(),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
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
    );
  }
}
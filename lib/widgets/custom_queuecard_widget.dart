import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/models/queue_collection_model.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/models/vehicle_model.dart';
import 'package:puvoms/services/database.dart';

class CustomQueueCard extends StatefulWidget {
  
  final QueueCollection? value;
  final VehicleCollection? vehicleData;
  
  const CustomQueueCard({
    Key? key,
    this.value,
    this.vehicleData
  }) : super(key: key);

  @override
  State<CustomQueueCard> createState() => _CustomQueueCardState();
}

class _CustomQueueCardState extends State<CustomQueueCard> {
  @override
  Widget build(BuildContext context) {
    
    DateTime datePaid = widget.value!.queueStart;
    var departure = datePaid.add(const Duration(minutes: 30));
    var dateFormat = DateFormat('MMMM d, yyyy').format(datePaid);
    var timeFormat = DateFormat.jm().format(datePaid);
    var departFormat = DateFormat.jm().format(departure);

    //debugPaintSizeEnabled = true;
    final user = Provider.of<UserObject?>(context);

    bool inQueue = widget.value!.inQueue;

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user!.uid).userData,
      builder: (context, snapshot) {
        UserData? userData = snapshot.data;
        return Container(
          height: context.screenHeight*0.20,
          constraints: const BoxConstraints(
            minHeight: 150,
            minWidth: double.infinity,
          ),
          child: inQueue? Card(
            child: InkWell(
              onTap: () async {
                await DatabaseService(uid: user.uid).createPayment(
                  user.uid!, 
                  "${userData!.firstName!} ${userData.lastName!}", 
                  DateTime.now(), 
                  "${widget.value!.firstName} ${widget.value!.lastName}" ,
                  widget.value!.uid,
                  widget.vehicleData!.vehicleBrand, 
                  widget.vehicleData!.vehicleColor, 
                  widget.vehicleData!.plateNumber
                );
                if(widget.value!.passengerCount < 15){
                  var newValue = widget.value!.passengerCount + 1;
                  await DatabaseService(uid: user.uid).addPassenger(widget.value!.uid, newValue);
                }
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(context.secondaryWP, context.secondaryHP, context.secondaryWP, context.secondaryHP),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: Image(
                                image: AssetImage('lib/assets/puvoms_logo.png'),
                              ),
                            )
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(2),
                                            child: Text("Queueing")
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("${widget.value?.plateNumber}")
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("A ${widget.vehicleData?.vehicleColor} ${widget.vehicleData?.vehicleBrand}")
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ),
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              alignment: Alignment.topRight,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      const WidgetSpan(child: Icon(Icons.person, size: 16,)),
                                      TextSpan(text: "${widget.value?.passengerCount}/15", style: const TextStyle(fontSize: 12))
                                    ]
                                  )
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Text("Estimated Time of Departure: $departFormat")
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text("Queue Started at $timeFormat")
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const[
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                  "Meycauayan",
                                  maxLines: null,
                                  overflow: TextOverflow.ellipsis,
                                  )
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text("---- 2h 30m ----")
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    "Monumento",
                                    maxLines: null,
                                    overflow: TextOverflow.ellipsis,
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ): Container()
        );
      }
    );
  }
}

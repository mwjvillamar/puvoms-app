import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/models/queue_collection_model.dart';
import 'package:puvoms/models/vehicle_model.dart';

class CustomCardItem extends StatefulWidget {
  
  final QueueCollection? value;
  final VehicleCollection? vehicleData;
  
  const CustomCardItem({
    Key? key,
    this.value,
    this.vehicleData
  }) : super(key: key);

  @override
  State<CustomCardItem> createState() => _CustomCardItemState();
}

class _CustomCardItemState extends State<CustomCardItem> {
  @override
  Widget build(BuildContext context) {

    //debugPaintSizeEnabled = true;
    
    bool inQueue = widget.value!.inQueue;

    return Container(
      height: context.screenHeight*0.20,
      constraints: const BoxConstraints(
        minHeight: 150,
        minWidth: double.infinity,
      ),
      child: inQueue? Card(
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
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                      child: const Text("Queueing")
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Text("${widget.value?.plateNumber}")
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(2),
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
              const Expanded(
                flex: 1,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text("Estimated Time of Departure: 11:11")
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text("Queue Started at +${widget.value?.queueStart}")
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
      ): Container()
    );
  }
}

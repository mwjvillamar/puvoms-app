import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:puvoms/features/queue/models/queue_collection_model.dart';
import 'package:puvoms/features/queue/models/vehicle_model.dart';
import 'package:puvoms/widgets/custom_queueitem_widget.dart';

class DriverQueueDetails extends StatefulWidget {
  
  final QueueData? queueValue;
  final VehicleData? vehicleValue;
  
  const DriverQueueDetails({Key? key,
    this.queueValue,
    this.vehicleValue
  }) : super(key: key);

  @override
  State<DriverQueueDetails> createState() => _DriverQueueDetailsState();
}

class _DriverQueueDetailsState extends State<DriverQueueDetails> {
  @override
  Widget build(BuildContext context) {
    
    // DateTime? datePaid = widget.queueValue?.queueStart!;
    // var departure = datePaid.add(const Duration(minutes: 30));
    // var dateFormat = DateFormat('MMMM d, yyyy').format(datePaid);
    // var timeFormat = DateFormat.jm().format(datePaid);
    // var departFormat = DateFormat.jm().format(departure);   
    //Weird interactions with snapshots
    
    return Column(
      children: [
        if (widget.queueValue?.inQueue == true) ...[
          const CustomQueueItem(
            icon: Icons.departure_board,
            text: 'Queue Status',
            value: "Queued",
          ),
        ] else ...[
          const CustomQueueItem(
            icon: Icons.departure_board,
            text: 'Queue Status',
            value: "Not Queued",
          ),
        ],
        CustomQueueItem(
          icon: Icons.map,
          text: 'Passengers: ',
          value: widget.queueValue?.passengerCount.toString(),
        ),
        CustomQueueItem(
          icon: Icons.directions_car,
          text: 'Model: ',
          value: widget.vehicleValue?.vehicleBrand,
        ),
        CustomQueueItem(
          icon: Icons.color_lens,
          text: 'Color: ',
          value: widget.vehicleValue?.vehicleColor,
        ),
        CustomQueueItem(
          icon: Icons.numbers,
          text: 'License No.: ',
          value: widget.vehicleValue?.plateNumber,
        ),
        CustomQueueItem(
          icon: Icons.departure_board,
          text: 'Queue Start: ',
          // value: timeFormat,
        ),
        CustomQueueItem(
          icon: Icons.departure_board,
          text: 'Estimated Time of Departure: ',
          // value: departFormat,
        ),
      ],
    );
  }
}

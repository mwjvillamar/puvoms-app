import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/widgets/custom_button_widget.dart';
import 'package:puvoms/widgets/custom_label_widget.dart';
import 'package:puvoms/widgets/custom_queueitem_widget.dart';

class DriverQueueView extends StatefulWidget {
  const DriverQueueView({Key? key}) : super(key: key);

  @override
  State<DriverQueueView> createState() => _DriverQueueViewState();
}

class _DriverQueueViewState extends State<DriverQueueView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    //debugPaintSizeEnabled = true;

    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, 0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
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
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('lib/assets/puvoms_logo.png'),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: context.mainHP),
                  CustomButton(text: "QUEUE IN"),
                  SizedBox(height: context.mainHP),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        CustomQueueItem(icon: Icons.confirmation_number, text: 'Queue No.:'),
                        CustomQueueItem(icon: Icons.people, text: 'Passenger:'),
                        CustomQueueItem(icon: Icons.departure_board, text: 'Status:'),
                        CustomQueueItem(icon: Icons.directions_car, text: 'Model:'),
                        CustomQueueItem(icon: Icons.color_lens, text: 'Color:'),
                        CustomQueueItem(icon: Icons.numbers, text: 'License No.:'),
                        CustomQueueItem(icon: Icons.departure_board, text: 'Queue Start:'),
                        CustomQueueItem(icon: Icons.departure_board, text: 'Estimated Time of Departure:'),
                        CustomQueueItem(icon: Icons.map, text: 'Route:')
                        // CustomLabel(icon: Icons.queue, text: ' Queue No.: '),
                        // CustomQueueItem(text: 'Queue No.: ', item: '6'),
                        // CustomQueueItem(text: 'Passenger: ', item: '0/16'),
                        // CustomQueueItem(text: 'Status: ', item: 'DEPARTING'),
                        // CustomQueueItem(text: 'Model: ', item: '??????????'),
                        // CustomQueueItem(text: 'Color: ', item: '??????????'),
                        // CustomQueueItem(text: 'License No.: ', item: '??????????'),
                        // CustomQueueItem(text: 'Queue Start:  ', item: '11:11'),
                        // CustomQueueItem(text: 'Estimated Time of Departure: ', item: '11:11'),
                        // CustomQueueItem(text: 'Route: ', item: 'Meycauayan to Monumento')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/widgets/custom_carditem_widget.dart';
import 'package:puvoms/constants/material_constant.dart';

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

    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, 0),
        child: ListView(
          children: const[
            CustomCardItem(),
            CustomCardItem(),
            CustomCardItem(),
            CustomCardItem(),
            CustomCardItem(),
            CustomCardItem(),
          ],
        ),
      ),
    );
  }
}
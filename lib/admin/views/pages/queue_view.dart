import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/widgets/custom_carditem_widget.dart';

class QueueView extends StatefulWidget {
  const QueueView({Key? key}) : super(key: key);

  @override
  State<QueueView> createState() => _QueueViewState();
}

class _QueueViewState extends State<QueueView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //debugPaintSizeEnabled = true;

    // TODO: implement build

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
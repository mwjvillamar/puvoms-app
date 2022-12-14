import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/widgets/custom_paymentcard_widget.dart';
import 'package:puvoms/widgets/custom_queuecard_widget.dart';

class DriverTallyView extends StatefulWidget {
  const DriverTallyView({Key? key}) : super(key: key);

  @override
  State<DriverTallyView> createState() => _AdminTallyViewState();
}

class _AdminTallyViewState extends State<DriverTallyView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return Center(
      child: ListView(
        padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
        children: [
          // CustomPaymentCard(),
          // CustomPaymentCard(),
          // CustomPaymentCard(),
          // CustomPaymentCard(),
        ],
      ),
    );
  }
}
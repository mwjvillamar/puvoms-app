import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/models/payment_model.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/passenger/views/pages/passenger_payment_list.dart';
import 'package:puvoms/services/database.dart';
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

    final user = Provider.of<UserObject?>(context);

    // TODO: implement build

    return StreamProvider<List<PaymentCollection>>.value(
      value: DatabaseService().getDriverPaymentsList(user!.uid.toString()), 
      initialData: const [],
      child: const Scaffold(
        body: Center(
          child: PassengerPaymentList(),
        )
      ),
    );
  }
}
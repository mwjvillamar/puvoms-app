import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/models/payment_model.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/passenger/views/pages/passenger_payment_list.dart';
import 'package:puvoms/services/database.dart';

class PassengerTallyView extends StatefulWidget {
  const PassengerTallyView({Key? key}) : super(key: key);

  @override
  State<PassengerTallyView> createState() => _TallyViewState();
}

class _TallyViewState extends State<PassengerTallyView> {

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
      value: DatabaseService().getUserPaymentsList(user!.uid.toString()), 
      initialData: const [],
      child: const Center(
          child: PassengerPaymentList(),
        )
      );
  }
}
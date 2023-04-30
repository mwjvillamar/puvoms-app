import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/features/tally/views/pages/admin_paymentcard_widget.dart';
import 'package:puvoms/features/tally/models/payment_model.dart';
import 'package:puvoms/constants/material_constant.dart';

class PassengerPaymentList extends StatefulWidget {
  const PassengerPaymentList({super.key});

  @override
  State<PassengerPaymentList> createState() => _PassengerPaymentListState();
}

class _PassengerPaymentListState extends State<PassengerPaymentList> {
  @override
  Widget build(BuildContext context) {
    
    final paymentsList = Provider.of<List<PaymentCollection>>(context);
    
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
      itemCount: paymentsList.length,
      itemBuilder: (context, index) {
        return AdminPaymentCard(paymentValue: paymentsList[index]);
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/admin/views/pages/admin_paymentcard_widget.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/features/tally/models/payment_model.dart';

class AdminPaymentList extends StatefulWidget {
  const AdminPaymentList({super.key});

  @override
  State<AdminPaymentList> createState() => _AdminPaymentListState();
}

class _AdminPaymentListState extends State<AdminPaymentList> {
  @override
  Widget build(BuildContext context) {
    
    final paymentsList = Provider.of<List<PaymentCollection>>(context);
    
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainWP),
      itemCount: paymentsList.length,
      itemBuilder: (context, index) {
        return AdminPaymentCard(paymentValue: paymentsList[index]);
      },
    );
  }
}
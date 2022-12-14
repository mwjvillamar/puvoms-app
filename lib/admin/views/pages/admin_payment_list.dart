import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/admin/views/pages/admin_paymentcard_widget.dart';
import 'package:puvoms/models/payment_model.dart';

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
      itemCount: paymentsList.length,
      itemBuilder: (context, index) {
        return AdminPaymentCard(paymentValue: paymentsList[index],);
      },
    );
  }
}
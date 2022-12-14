import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/admin/views/pages/admin_payment_list.dart';
import 'package:puvoms/models/payment_model.dart';
import 'package:puvoms/services/database.dart';

class AdminPaymentView extends StatefulWidget {
  const AdminPaymentView({Key? key}) : super(key: key);

  @override
  State<AdminPaymentView> createState() => _AdminPaymentViewState();
}

class _AdminPaymentViewState extends State<AdminPaymentView> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return StreamProvider<List<PaymentCollection>>.value(
      value: DatabaseService().paymentsList, 
      initialData: [],
      child: const Center(
        child: AdminPaymentList(),
      ),
    );
  }
}

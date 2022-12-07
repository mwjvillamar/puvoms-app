import 'package:flutter/material.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return const Center(
        child: Text(
            "Payment View"
        )
    );
  }
}

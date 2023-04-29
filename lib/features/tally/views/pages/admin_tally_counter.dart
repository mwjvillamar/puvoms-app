import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/features/tally/models/payment_model.dart';

class AdminTallyCounter extends StatefulWidget {
  const AdminTallyCounter({super.key});

  @override
  State<AdminTallyCounter> createState() => _AdminTallyCounterState();
}


class _AdminTallyCounterState extends State<AdminTallyCounter> {
  @override
  Widget build(BuildContext context) {
    
    final paymentsList = Provider.of<List<PaymentCollection>>(context);
    
    return Expanded(
      flex: 3,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Expanded(
              flex: 4,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(paymentsList.length.toString())
                )
              )
            ),
            const Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("Total Passengers")
                )
              )
            )
          ],
        ),
      )
    );
  }
}
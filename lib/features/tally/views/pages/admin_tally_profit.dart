import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/features/tally/models/payment_model.dart';
import 'package:puvoms/constants/material_constant.dart';

class AdminTallyProfit extends StatefulWidget {
  const AdminTallyProfit({super.key});

  @override
  State<AdminTallyProfit> createState() => _AdminTallyProfit();
}


class _AdminTallyProfit extends State<AdminTallyProfit> {
  @override
  Widget build(BuildContext context) {
    
    final paymentsList = Provider.of<List<PaymentCollection>>(context);
    String totalIncome = (paymentsList.length * 16).toStringAsFixed(2);
    String callersCut = (paymentsList.length * 16 * 0.1).toStringAsFixed(2);
    
    return Expanded(
      flex: 2,
      child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    children: [
                      Text("Total Income: P$totalIncome"),
                      Text("Caller's Cut: P$callersCut")
                    ],
                  ),
                ),
              ),
            )
          ]
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/features/tally/views/pages/admin_tally_counter.dart';
import 'package:puvoms/features/tally/views/pages/admin_tally_profit.dart';
import 'package:puvoms/features/tally/models/payment_model.dart';
import 'package:puvoms/services/database.dart';

class AdminTallyProvider extends StatefulWidget {
  const AdminTallyProvider({super.key});

  @override
  State<AdminTallyProvider> createState() => _AdminTallyProviderState();
}

class _AdminTallyProviderState extends State<AdminTallyProvider> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PaymentCollection>>.value(
      value: DatabaseService().paymentsList, 
      initialData: [],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AdminTallyCounter(),
          AdminTallyProfit(),
        ],
      )
    );
  }
}
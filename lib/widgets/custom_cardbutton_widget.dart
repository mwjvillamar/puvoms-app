import 'package:flutter/material.dart';
import 'package:puvoms/admin/views/pages/driver_view.dart';
import 'package:puvoms/admin/views/pages/summary_view.dart';
import 'package:puvoms/admin/views/pages/calendar_view.dart';
import 'package:puvoms/admin/views/pages/payment_view.dart';

class CustomCardButton extends StatelessWidget {

  final IconData icon;
  final String text;

  const CustomCardButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: InkWell(
          onTap: () {
            if(key == const ValueKey("payments")) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentView()));
            }
            else if(key == const ValueKey("drivers")) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DriverView()));
            }
            else if(key == const ValueKey("calendar")) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CalendarView()));
            }
            else if(key == const ValueKey("summary")) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SummaryView()));
            }
            else
            {
              // TODO: Implement onTap method
            }
          },
          child: FittedBox(
            child: Column(
              children: [
                Icon(icon),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(text)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:puvoms/views/pages/calendar_view.dart';
import 'package:puvoms/views/pages/driver_view.dart';
import 'package:puvoms/views/pages/payment_view.dart';
import 'package:puvoms/views/pages/summary_view.dart';
import 'package:puvoms/views/pages/users_view.dart';

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
        color: Colors.black87,
        child: InkWell(
          onTap: () {
            if(key == const ValueKey("payments")) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentView()));
            }
            else if(key == const ValueKey("users")){
             Navigator.push(context, MaterialPageRoute(builder: (context) => const UsersView())); 
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
                const SizedBox(height: 2,),
                Icon(
                  icon,
                  color: Colors.white,
                  size: 10.0,
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 5.0,
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:puvoms/features/tally/views/pages/admin_summary_view.dart';
import 'package:puvoms/features/tally/views/pages/admin_calendar_view.dart';
import 'package:puvoms/features/tally/views/pages/admin_payment_view.dart';
import 'package:puvoms/features/tally//views/pages/admin_users_view.dart';

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
        color: Colors.blueAccent,
        child: InkWell(
          onTap: () {
            if(key == const ValueKey("payments")) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminPaymentView()));
            }
            else if(key == const ValueKey("users")){
             Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminUsersView())); 
            }
            else if(key == const ValueKey("calendar")) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminCalendarView()));
            }
            else if(key == const ValueKey("summary")) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminSummaryView()));
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
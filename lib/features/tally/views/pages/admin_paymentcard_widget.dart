import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/features/tally/models/payment_model.dart';

class AdminPaymentCard extends StatefulWidget {
  
  final PaymentCollection? paymentValue;
  
  const AdminPaymentCard({
    Key? key,
    required this.paymentValue
    }) : super(key: key);

  @override
  State<AdminPaymentCard> createState() => _AdminPaymentCardState();
}

class _AdminPaymentCardState extends State<AdminPaymentCard> {

  @override
  Widget build(BuildContext context) {
    DateTime datePaid = widget.paymentValue!.datePaid;
    var dateFormat = DateFormat('MMMM d, yyyy').format(datePaid);
    var timeFormat = DateFormat.jm().format(datePaid);
    
    return Container(
        height: context.screenHeight*0.15,
        constraints: const BoxConstraints(
        minHeight: 100,
        minWidth: double.infinity,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.fromLTRB(context.secondaryWP, context.secondaryHP, context.secondaryWP, context.secondaryHP),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(dateFormat.toString()),
                            Text(timeFormat.toString())
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: FittedBox(
                          child: Icon(Icons.directions_bus),
                          alignment: Alignment.centerLeft,
                        )
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(context.secondaryWP, context.secondaryHP, context.secondaryWP, context.secondaryHP),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Ticket Cost:"),
                        Text("16.00")
                      ]
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Image(
                        image: AssetImage('lib/assets/user_placeholder_image.png'),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: FittedBox(
                        child: Text(
                          widget.paymentValue!.passengerName,
                          maxLines: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

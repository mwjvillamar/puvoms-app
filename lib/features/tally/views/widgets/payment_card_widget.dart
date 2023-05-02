import 'package:flutter/material.dart';
import 'package:puvoms/constants/material_constant.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {

  @override
  Widget build(BuildContext context) {
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
                            Text("April 16, 2015"),
                            Text("6:00 am")
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
                flex: 2,
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(context.secondaryWP, context.secondaryHP, context.secondaryWP, context.secondaryHP),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Net Profit:"),
                        Text("1000.00")
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
                          "Anonymous",
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

import 'package:flutter/material.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/views/widgets/custom_cardbutton_widget.dart';

class QueueView extends StatefulWidget {
  const QueueView({Key? key}) : super(key: key);

  @override
  State<QueueView> createState() => _QueueViewState();
}

class _QueueViewState extends State<QueueView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Card(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const[
                      Expanded(
                          flex: 4,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                              child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text("22")
                              )
                          )
                      ),
                      Expanded(
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
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Column(
                          children: const[
                            Text("Total Income: P200.00"),
                            Text("Caller's Cut: P100.00")
                          ],
                        ),
                      ),
                    ),
                  )
                ]
              )
            ),
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const[
                        CustomCardButton(icon: Icons.payments, text: "Payments"),
                        CustomCardButton(icon: Icons.airport_shuttle, text: "Drivers")
                      ]
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const[
                        CustomCardButton(icon: Icons.calendar_month, text: "Calendar"),
                        CustomCardButton(icon: Icons.summarize, text: "Summary"),
                      ]
                    ),
                  )
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/admin/views/pages/admin_tally_provider.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/widgets/custom_cardbutton_widget.dart';

class AdminTallyView extends StatefulWidget {
  const AdminTallyView({Key? key}) : super(key: key);

  @override
  State<AdminTallyView> createState() => _AdminTallyViewState();
}

class _AdminTallyViewState extends State<AdminTallyView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //debugPaintSizeEnabled = true;

    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Expanded(
              //     flex: 3,
              //     child: Card(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: const[
              //           Expanded(
              //               flex: 4,
              //               child: FittedBox(
              //                   fit: BoxFit.fitWidth,
              //                   child: Padding(
              //                       padding: EdgeInsets.all(2),
              //                       child: Text("22")
              //                   )
              //               )
              //           ),
              //           Expanded(
              //               flex: 1,
              //               child: FittedBox(
              //                   fit: BoxFit.fitWidth,
              //                   child: Padding(
              //                       padding: EdgeInsets.all(5),
              //                       child: Text("Total Passengers")
              //                   )
              //               )
              //           )
              //         ],
              //       ),
              //     )
              // ),
              // Expanded(
              //     flex: 3,
              //     child: Column(
              //         children: [
              //           Expanded(
              //             child: Padding(
              //               padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
              //               child: FittedBox(
              //                 fit: BoxFit.contain,
              //                 child: Column(
              //                   children: const[
              //                     Text("Total Income: P200.00"),
              //                     Text("Caller's Cut: P100.00")
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           )
              //         ]
              //     )
              // ),
              const Expanded(flex: 5, child: AdminTallyProvider()),
              Expanded(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: const[
                            CustomCardButton(key: ValueKey("payments"), icon: Icons.payments, text: "Payments"),
                            CustomCardButton(key: ValueKey("users"), icon: Icons.account_circle, text: "Users")
                          ]
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: const[
                            CustomCardButton(key: ValueKey("calendar"), icon: Icons.calendar_month, text: "Calendar"),
                            CustomCardButton(key: ValueKey("summary"), icon: Icons.summarize, text: "Summary"),
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
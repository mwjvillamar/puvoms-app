import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';

class CustomCardItem extends StatefulWidget {
  const CustomCardItem({Key? key}) : super(key: key);

  @override
  State<CustomCardItem> createState() => _CustomCardItemState();
}

class _CustomCardItemState extends State<CustomCardItem> {
  @override
  Widget build(BuildContext context) {

    //debugPaintSizeEnabled = true;

    return Container(
      height: context.screenHeight*0.20,
      constraints: const BoxConstraints(
        minHeight: 150,
        minWidth: double.infinity,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.fromLTRB(context.secondaryWP, context.secondaryHP, context.secondaryWP, context.secondaryHP),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Image(
                          image: AssetImage('lib/assets/puvoms_logo.png'),
                        ),
                      )
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: FittedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const[
                                  Padding(
                                    padding: EdgeInsets.all(2),
                                      child: Text("STATUS")
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Text("License Plate")
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Text("Vehicle Type & Color")
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                    const Expanded(
                      flex: 1,
                      child: FittedBox(
                        alignment: Alignment.topRight,
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(child: Icon(Icons.person)),
                                TextSpan(text: "0/0")
                              ]
                            )
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ),
              const Expanded(
                flex: 1,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text("Estimated Time of Departure: 11:11")
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text("Queue Started at 6:06")
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: const[
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Text(
                            "Meycauayan",
                            maxLines: null,
                            overflow: TextOverflow.ellipsis,
                            )
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Text("---- 2h 30m ----")
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Text(
                              "Monumento",
                              maxLines: null,
                              overflow: TextOverflow.ellipsis,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

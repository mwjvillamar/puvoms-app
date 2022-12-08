import 'package:flutter/material.dart';
import 'package:puvoms/passenger/views/pages/passenger_account_view.dart';
import 'package:puvoms/passenger/views/pages/passenger_geolocation_view.dart';
import 'package:puvoms/passenger/views/pages/passenger_queue_view.dart';
import 'package:puvoms/passenger/views/pages/passenger_tally_view.dart';

class PassengerNavigationController extends StatelessWidget {

  final GlobalKey<NavigatorState> navigatorKey;
  final String tab;

  const PassengerNavigationController({Key? key, required this.navigatorKey, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget child = const PassengerGeolocationView();

    if(tab == "geolocation") {
      child = const PassengerGeolocationView();
    }
    else if(tab == "tally") {
      child = const PassengerTallyView();
    }
    else if(tab == "queue") {
      child = const PassengerQueueView();
    }
    else if(tab == "account") {
      child = const PassengerAccountView();
    }

    return Navigator(
        key: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) => child);
        }
    );
  }
}

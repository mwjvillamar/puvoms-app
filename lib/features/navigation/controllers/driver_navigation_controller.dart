import 'package:flutter/material.dart';
import 'package:puvoms/features/account/views/pages/driver_account_view.dart';
import 'package:puvoms/features/inbox/views/pages/driver_inbox_view.dart';
import 'package:puvoms/features/geolocation/views/pages/driver_geolocation_view.dart';
import 'package:puvoms/features/queue/views/pages/driver_queue_view.dart';
import 'package:puvoms/features/tally/views/pages/driver_tally_view.dart';

class DriverNavigationController extends StatelessWidget {

  final GlobalKey<NavigatorState> navigatorKey;
  final String tab;

  const DriverNavigationController({Key? key, required this.navigatorKey, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget child = const DriverGeolocationView();

    if(tab == "geolocation") {
      child = const DriverGeolocationView();
    }
    else if(tab == "tally") {
      child = const DriverTallyView();
    }
    else if(tab == "queue") {
      child = const DriverQueueView();
    }
    else if(tab == "inbox") {
      child = const DriverInboxView();
    }
    else if(tab == "account") {
      child = const DriverAccountView();
    }

    return Navigator(
        key: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) => child);
        }
    );
  }
}

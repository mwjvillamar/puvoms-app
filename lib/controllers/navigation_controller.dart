import 'package:flutter/material.dart';
import 'package:puvoms/views/pages/account_view.dart';
import 'package:puvoms/views/pages/geolocation_view.dart';
import 'package:puvoms/views/pages/inbox_view.dart';
import 'package:puvoms/views/pages/queue_view.dart';
import 'package:puvoms/views/pages/tally_view.dart';

class NavigationController extends StatelessWidget {

  final GlobalKey<NavigatorState> navigatorKey;
  final String page;

  const NavigationController({Key? key, required this.navigatorKey, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget child = const GeolocationView();

    if(page == "geolocation") {
      child = const GeolocationView();
    }
    else if(page == "tally") {
      child = const TallyView();
    }
    else if(page == "queue") {
      child = const QueueView();
    }
    else if(page == "inbox") {
      child = const InboxView();
    }
    else if(page == "account") {
      child = const AccountView();
    }

    return Navigator(
        key: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) => child);
        }
    );
  }
}

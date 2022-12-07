import 'package:flutter/material.dart';
import 'package:puvoms/admin/views/pages/account_view.dart';
import 'package:puvoms/admin/views/pages/inbox_view.dart';
import 'package:puvoms/admin/views/pages/geolocation_view.dart';
import 'package:puvoms/admin/views/pages/queue_view.dart';
import 'package:puvoms/admin/views/pages/tally_view.dart';

class NavigationController extends StatelessWidget {

  final GlobalKey<NavigatorState> navigatorKey;
  final String tab;

  const NavigationController({Key? key, required this.navigatorKey, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget child = const GeolocationView();

    if(tab == "geolocation") {
      child = const GeolocationView();
    }
    else if(tab == "tally") {
      child = const TallyView();
    }
    else if(tab == "queue") {
      child = const QueueView();
    }
    else if(tab == "inbox") {
      child = const InboxView();
    }
    else if(tab == "account") {
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

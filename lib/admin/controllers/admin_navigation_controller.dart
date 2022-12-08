import 'package:flutter/material.dart';
import 'package:puvoms/admin/views/pages/admin_account_view.dart';
import 'package:puvoms/admin/views/pages/admin_inbox_view.dart';
import 'package:puvoms/admin/views/pages/admin_geolocation_view.dart';
import 'package:puvoms/admin/views/pages/admin_queue_view.dart';
import 'package:puvoms/admin/views/pages/admin_tally_view.dart';

class AdminNavigationController extends StatelessWidget {

  final GlobalKey<NavigatorState> navigatorKey;
  final String tab;

  const AdminNavigationController({Key? key, required this.navigatorKey, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget child = const AdminGeolocationView();

    if(tab == "geolocation") {
      child = const AdminGeolocationView();
    }
    else if(tab == "tally") {
      child = const AdminTallyView();
    }
    else if(tab == "queue") {
      child = const AdminQueueView();
    }
    else if(tab == "inbox") {
      child = const AdminInboxView();
    }
    else if(tab == "account") {
      child = const AdminAccountView();
    }

    return Navigator(
        key: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) => child);
        }
    );
  }
}

import 'package:puvoms/views/pages/account_view.dart';
import 'package:puvoms/views/pages/geolocation_view.dart';
import 'package:puvoms/views/pages/inbox_view.dart';
import 'package:puvoms/views/pages/queue_view.dart';
import 'package:puvoms/views/pages/tally_view.dart';

class NavigationController {

  // BottomNavigationBar starting index
  int currentIndex = 0;

  // BottomNavigationBar routes
  final routes = [
    const GeolocationView(),
    const TallyView(),
    const QueueView(),
    const InboxView(),
    const AccountView()
  ];

  // Set index to routes
  void navigate(index) {
    currentIndex = index;
  }

}
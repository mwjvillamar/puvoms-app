import 'package:puvoms/views/account_view.dart';
import 'package:puvoms/views/geolocation_view.dart';
import 'package:puvoms/views/inbox_view.dart';
import 'package:puvoms/views/queue_view.dart';
import 'package:puvoms/views/tally_view.dart';

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
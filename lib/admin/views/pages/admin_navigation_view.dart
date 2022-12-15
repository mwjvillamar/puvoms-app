import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../../controllers/admin_navigation_controller.dart';

class AdminNavigationView extends StatefulWidget {

  const AdminNavigationView({Key? key}) : super(key: key);

  @override
  State<AdminNavigationView> createState() => _AdminNavigationViewState();
}

class _AdminNavigationViewState extends State<AdminNavigationView>{

  DateTime backPressedTime = DateTime.now();

  String currentTab = "geolocation";
  int currentIndex = 0;

  final List<String> tabList = [
    "geolocation",
    "tally",
    "queue",
    "inbox",
    "account"
  ];

  final Map<String, GlobalKey<NavigatorState>> tabKeys = {
    "geolocation": GlobalKey<NavigatorState>(),
    "tally": GlobalKey<NavigatorState>(),
    "queue": GlobalKey<NavigatorState>(),
    "inbox": GlobalKey<NavigatorState>(),
    "account": GlobalKey<NavigatorState>(),
  };

  void selectPage(String tab, int index) {
    if(tab == currentTab) {
      tabKeys[tab]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        currentTab = tab;
        currentIndex = index;
      });
    }
  }

  Widget buildOffstageNavigator(String tab) {
    return Offstage(
      offstage: currentTab != tab,
      child: AdminNavigationController(
        navigatorKey: tabKeys[tab]!,
        tab: tab,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Set to true for layout debugging
    debugPaintSizeEnabled = false;

    return WillPopScope(
      onWillPop: () async {
        // bool value to check if currently in first page of navigator stack
        final isFirstRouteInCurrentTab = !await tabKeys[currentTab]!.currentState!.maybePop();

        // if on first page of navigator stack
        if (isFirstRouteInCurrentTab == true) {
          // check if currently not geolocation (default) tab
          if (currentTab != "geolocation") {
            // redirect to geolocation (default) tab
            selectPage("geolocation", 0);
            // retain app
            return false;
          }
          // if already on geolocation (default) tab
          else if (currentTab == "geolocation") {
            // get difference of backPressedTime minus present time
            final difference = DateTime.now().difference(backPressedTime);
            // re-set backPressedTime to present time
            backPressedTime = DateTime.now();
            // if frequency of press is faster than or equal to 1 second
            if (difference <= const Duration(seconds: 1)) {
              // exit app
              return true;
            }
            // else
            else {
              // retain app
              return false;
            }
          }
        }

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            buildOffstageNavigator("geolocation"),
            buildOffstageNavigator("tally"),
            buildOffstageNavigator("queue"),
            buildOffstageNavigator("inbox"),
            buildOffstageNavigator("account"),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: currentIndex,
            onTap: (index) => selectPage(tabList[index], index),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.location_pin),
                label: 'Track',
                backgroundColor: Colors.blueAccent,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist),
                label: 'Tally',
                backgroundColor: Colors.blueAccent
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.queue),
                label: 'Queue',
                backgroundColor: Colors.blueAccent
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inbox),
                label: 'Inbox',
                backgroundColor: Colors.blueAccent
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
                backgroundColor: Colors.blueAccent
              ),
            ],
          )
      ),
    );
  }

}

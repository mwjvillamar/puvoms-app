import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../controllers/navigation_controller.dart';

class NavigationView extends StatefulWidget {

  const NavigationView({Key? key}) : super(key: key);

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView>{

  String currentPage = "geolocation";
  int currentIndex = 0;

  final List<String> pageList = [
    "geolocation",
    "tally",
    "queue",
    "inbox",
    "account"
  ];

  final Map<String, GlobalKey<NavigatorState>> pageKeys = {
    "geolocation": GlobalKey<NavigatorState>(),
    "tally": GlobalKey<NavigatorState>(),
    "queue": GlobalKey<NavigatorState>(),
    "inbox": GlobalKey<NavigatorState>(),
    "account": GlobalKey<NavigatorState>(),
  };

  void selectPage(String page, int index) {
    if(page == currentPage) {
      pageKeys[page]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        currentPage = page;
        currentIndex = index;
      });
    }
  }

  Widget buildOffstageNavigator(String page) {
    return Offstage(
      offstage: currentPage != page,
      child: NavigationController(
        navigatorKey: pageKeys[page]!,
        page: page,
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
        final isFirstRouteInCurrentTab = !await pageKeys[currentPage]!.currentState!.maybePop();

        if (isFirstRouteInCurrentTab) {
          if (currentPage != "geolocation") {
            selectPage("geolocation", 0);
            return false;
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
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) => selectPage(pageList[index], index),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.location_pin),
                label: 'Track',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist),
                label: 'Tally',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.queue),
                label: 'Queue',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inbox),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
          )
      ),
    );
  }

}

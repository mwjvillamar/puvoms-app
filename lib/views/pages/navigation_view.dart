import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../controllers/navigation_controller.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> with NavigationController {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Set to true for layout debugging
    debugPaintSizeEnabled = false;

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: routes
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
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
        onTap: (index) => setState(() {
            navigate(index);
          })
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/views/pages/account_view.dart';
import 'package:puvoms/views/pages/geolocation_view.dart';
import 'package:puvoms/views/pages/inbox_view.dart';
import 'package:puvoms/shared/load_view.dart';
import 'package:puvoms/views/pages/login_view.dart';
import 'package:puvoms/views/pages/navigation_view.dart';
import 'package:puvoms/views/pages/queue_view.dart';
import 'package:puvoms/views/pages/tally_view.dart';
import 'package:puvoms/views/pages/login_router.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Stream Provider will wrap all data inside the material app below,
      //Any changes from the stream will return the data below
      home: StreamProvider<UserObject?>.value(
        catchError: (_, __) => null,
        value: AuthService().user, 
        initialData: null, 
        child:MaterialApp(
          title: 'PUVOMS-3T',
          initialRoute: '/login-router',
          routes:{
            '/': (context) => const LoadView(),
            //LoginRouter = LandingPage, checks whether Login or Home
            '/login-router': (context) => const LoginRouter(),
            '/login': (context) => const LoginView(),
            //NavigationView = HomeView
            '/navigation': (context) => const NavigationView(),
            '/geolocation': (context) => const GeolocationView(),
            '/tally': (context) => const TallyView(),
            '/queue': (context) => const QueueView(),
            '/inbox': (context) => const InboxView(),
            '/account': (context) => const AccountView()
          }
      )),
    );
  }
}

//Rewrote main class to be available with async/await
//Fat Arrow Async await doesn't work...
//Waiting for further revisions

// void main() async => 
 
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp();
   
//     runApp(MaterialApp(title: 'PUVOMS-3T', 
//     initialRoute: '/wrapper', 
//     routes: {
//       '/': (context) => const LoadView(),
//       '/wrapper': (context) => const Wrapper(),
//       '/login': (context) => const LoginView(),
//       '/navigation': (context) => const NavigationView(),
//       '/geolocation': (context) => const GeolocationView(),
//       '/tally': (context) => const TallyView(),
//       '/queue': (context) => const QueueView(),
//       '/inbox': (context) => const InboxView(),
//       '/account': (context) => const AccountView()
//     }));

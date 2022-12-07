import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/admin/views/pages/account_view.dart';
import 'package:puvoms/admin/views/pages/geolocation_view.dart';
import 'package:puvoms/admin/views/pages/inbox_view.dart';
import 'package:puvoms/shared/load_view.dart';
import 'package:puvoms/shared/login_view.dart';
import 'package:puvoms/admin/views/pages/navigation_view.dart';
import 'package:puvoms/admin/views/pages/queue_view.dart';
import 'package:puvoms/admin/views/pages/tally_view.dart';
import 'package:puvoms/shared/login_router.dart';
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
          title: 'PUVOMS-T3',
          initialRoute: '/login-router',
          routes:{
            '/': (context) => const LoadView(),
            '/login-router': (context) => const LoginRouter(),
            '/login': (context) => const LoginView(),
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

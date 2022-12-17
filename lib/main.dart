import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/admin/views/pages/admin_account_view.dart';
import 'package:puvoms/admin/views/pages/admin_geolocation_view.dart';
import 'package:puvoms/admin/views/pages/admin_inbox_view.dart';
import 'package:puvoms/shared/load_view.dart';
import 'package:puvoms/shared/login_view.dart';
import 'package:puvoms/admin/views/pages/admin_navigation_view.dart';
import 'package:puvoms/admin/views/pages/admin_queue_view.dart';
import 'package:puvoms/admin/views/pages/admin_tally_view.dart';
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
      debugShowCheckedModeBanner: false,
      //Stream Provider will wrap all data inside the material app below,
      //Any changes from the stream will return the data below
      home: StreamProvider<UserObject?>.value(
        catchError: (_, __) => null,
        value: AuthService().user, 
        initialData: null, 
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PUVOMS-T3',
          initialRoute: '/login-router',
          routes:{
            '/': (context) => const LoadView(),
            '/login-router': (context) => const LoginRouter(),
            '/login': (context) => const LoginView(),
            '/navigation': (context) => const AdminNavigationView(),
            '/geolocation': (context) => const AdminGeolocationView(),
            '/tally': (context) => const AdminTallyView(),
            '/queue': (context) => const AdminQueueView(),
            '/inbox': (context) => const AdminInboxView(),
            '/account': (context) => const AdminAccountView()
          }
      )),
    );
  }
}

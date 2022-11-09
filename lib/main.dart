import 'package:flutter/material.dart';
import 'package:puvoms/views/pages/account_view.dart';
import 'package:puvoms/views/pages/geolocation_view.dart';
import 'package:puvoms/views/pages/inbox_view.dart';
import 'package:puvoms/views/pages/load_view.dart';
import 'package:puvoms/views/pages/login_view.dart';
import 'package:puvoms/views/pages/navigation_view.dart';
import 'package:puvoms/views/pages/queue_view.dart';
import 'package:puvoms/views/pages/register_view.dart';
import 'package:puvoms/views/pages/tally_view.dart';

void main() => runApp(MaterialApp(

    title: 'PUVOMS-3T',
    initialRoute: '/navigation',
    routes: {
      '/': (context) => const LoadView(),
      '/login': (context) => const LoginView(),
      '/register': (context) => const RegisterView(),
      '/navigation': (context) => const NavigationView(),
      '/geolocation': (context) => const GeolocationView(),
      '/tally': (context) => const TallyView(),
      '/queue': (context) => const QueueView(),
      '/inbox': (context) => const InboxView(),
      '/account': (context) => const AccountView()
    }
));
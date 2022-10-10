import 'package:flutter/material.dart';
import 'package:puvoms/views/account_view.dart';
import 'package:puvoms/views/geolocation_view.dart';
import 'package:puvoms/views/inbox_view.dart';
import 'package:puvoms/views/load_view.dart';
import 'package:puvoms/views/login_view.dart';
import 'package:puvoms/views/navigation_view.dart';
import 'package:puvoms/views/queue_view.dart';
import 'package:puvoms/views/tally_view.dart';

void main() => runApp(MaterialApp(
    title: 'PUVOMS-3T',
    initialRoute: '/navigation',
    routes: {
      '/': (context) => const LoadView(),
      '/login': (context) => const LoginView(),
      '/navigation': (context) => const NavigationView(),
      '/geolocation': (context) => const GeolocationView(),
      '/tally': (context) => const TallyView(),
      '/queue': (context) => const QueueView(),
      '/inbox': (context) => const InboxView(),
      '/account': (context) => const AccountView()
    }
));
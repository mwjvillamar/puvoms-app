import 'package:flutter/material.dart';
import 'package:puvoms/views/load_view.dart';
import 'package:puvoms/views/login_view.dart';
import 'package:puvoms/views/navigation_view.dart';

void main() => runApp(MaterialApp(
    title: 'PUVOMS-3T',
    initialRoute: '/login',
    routes: {
      '/': (context) => LoadView(),
      '/login': (context) => LoginView(),
      '/navigation': (context) => NavigationView()
    }
));

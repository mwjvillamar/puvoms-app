import 'package:flutter/material.dart';
import 'package:puvoms/views/pages/login_view.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //will change where we want to login or register?
      child: const LoginView(),
    );
  }
}

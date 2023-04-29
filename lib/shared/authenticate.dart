import 'package:flutter/material.dart';
import 'package:puvoms/features/register/views/pages/register_view.dart';
import 'package:puvoms/features/login/views/pages/login_view.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool showLogIn = true;
  
  toggleView() {
    setState(() => showLogIn = !showLogIn);
  }
  
  @override
  Widget build(BuildContext context) {
    if(showLogIn){
      return LoginView(toggleView: toggleView);
    } else {
      return RegisterView(toggleView: toggleView);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:puvoms/views/pages/login_view.dart';
import 'package:puvoms/views/pages/register_view.dart';
import 'package:puvoms/views/widgets/custom_button_widget.dart';
import 'package:puvoms/views/widgets/custom_textbutton_widget.dart';

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
      return LoginView(toggleView: toggleView,);
    } else {
      return RegisterView(toggleView: toggleView,);
    }
  }
}

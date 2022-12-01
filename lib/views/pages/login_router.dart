import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/views/pages/authenticate.dart';
import 'package:puvoms/views/pages/navigation_view.dart';

class LoginRouter extends StatelessWidget {
  const LoginRouter({super.key});

  @override
  Widget build(BuildContext context) {
    
    //Accessing the user data from the Provider.
    //null safety and shit...
    final user = Provider.of<UserObject?>(context);
    debugPrint("Provider Said: $user");
    
    //returns either the Home or Authenticate Widget
    if (user == null) {
      return const Authenticate();
    } else {
      return const NavigationView();
    }
  }
}

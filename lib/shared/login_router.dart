import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/driver/views/pages/driver_navigation_view.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/passenger/views/pages/passenger_navigation_view.dart';
import 'package:puvoms/services/database.dart';
import 'package:puvoms/shared/authenticate.dart';
import 'package:puvoms/admin/views/pages/admin_navigation_view.dart';

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
      return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData? userData = snapshot.data;
            if(userData!.role == "Admin"){
              debugPrint("snapshot has data ${userData.role}");
              return const AdminNavigationView();
            } else if(userData!.role == "Driver"){
              debugPrint("snapshot has data ${userData!.role}");
              return const DriverNavigationView();
            }
            debugPrint("snapshot has data ${userData!.role}");
            return const PassengerNavigationView();
          } else {
            debugPrint("snapshot has no data");
            return const PassengerNavigationView();
          }
        },
      );
    }
  }
}

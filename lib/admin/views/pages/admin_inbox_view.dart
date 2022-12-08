import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/models/user_model.dart';

class AdminInboxView extends StatefulWidget {
  const AdminInboxView({Key? key}) : super(key: key);

  @override
  State<AdminInboxView> createState() => _AdminInboxViewState();
}

class _AdminInboxViewState extends State<AdminInboxView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    // TODO: implement build
    
    return StreamBuilder<UserData>(
      stream: null,
      builder: (context, snapshot) {
        return Container(
          child: Center(
            child: Text(
              "Admin - Inbox page"
            ),
          ),
        );
      }
    );

  }
}
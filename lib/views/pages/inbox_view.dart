import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/models/user_model.dart';

class InboxView extends StatefulWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {

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
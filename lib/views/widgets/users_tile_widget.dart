import 'package:flutter/material.dart';
import 'package:puvoms/models/user_collection_model.dart';


class UsersTile extends StatelessWidget {
  
  final UserCollection? value;
  
  const UsersTile({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20, 0),
        child: ListTile(
          leading:  const Icon(
            Icons.account_circle_rounded,
            size: 20.0,
          ),
          title: Text(value!.name),
          subtitle: Text("ID: ${value!.uid} \nRole: ${value!.role} \nPhone Number: ${value!.phoneNum} Email: ${value!.email}"),
        ),
      ),
    );
  }
}
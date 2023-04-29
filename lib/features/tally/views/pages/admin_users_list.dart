import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/admin/views/pages/admin_users_tile_widget.dart';
import 'package:puvoms/models/user_collection_model.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    
    final users = Provider.of<List<UserCollection>>(context);
    
    // debugPrint(users.toString());
    
    // for (var doc in users!.docs){
    //   debugPrint(doc.data().toString());
    // }
    
    // users?.forEach((users){
    //   debugPrint(users.uid);
    //   debugPrint(users.name);
    //   debugPrint(users.role);
    //   debugPrint(users.phoneNum);
    //   debugPrint(users.email);
    // });
    
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UsersTile(value: users[index]);
      },
    );
  }
}
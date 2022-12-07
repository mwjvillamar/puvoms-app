import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puvoms/models/user_collection_model.dart';
import 'package:puvoms/services/database.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/widgets/users_list.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserCollection>>.value(
      value: DatabaseService().getUsers,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
          automaticallyImplyLeading: false,
        ),
        body: const UsersList(),
      )
    );
  }
}
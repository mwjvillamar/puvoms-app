import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puvoms/admin/views/pages/admin_users_list.dart';
import 'package:puvoms/models/user_collection_model.dart';
import 'package:puvoms/services/database.dart';
import 'package:provider/provider.dart';
class AdminUsersView extends StatefulWidget {
  const AdminUsersView({super.key});

  @override
  State<AdminUsersView> createState() => _AdminUsersViewState();
}

class _AdminUsersViewState extends State<AdminUsersView> {
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
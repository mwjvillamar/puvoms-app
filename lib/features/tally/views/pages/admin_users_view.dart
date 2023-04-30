import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puvoms/features/tally/views/pages/admin_users_list.dart';
import 'package:puvoms/features/queue/models/user_collection_model.dart';
import 'package:puvoms/services/database.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/widgets/custom_textformfield_widget.dart';
class AdminUsersView extends StatefulWidget {
  const AdminUsersView({super.key});

  @override
  State<AdminUsersView> createState() => _AdminUsersViewState();
}

class _AdminUsersViewState extends State<AdminUsersView> {
  
  String searchValue = "";
  
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: CustomTextFormField(
                isHidden: false, 
                hint: "Search User", 
                icon: Icons.abc_outlined,
                callbackFunction: (val) => setState(() => searchValue = val)
              ),
            ),
            const Expanded(flex: 9,child: UsersList()),
          ],
        ),
      )
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:puvoms/models/test_model.dart';
import 'package:puvoms/services/database.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/views/lists/test_list_widget.dart';

class QueueView extends StatefulWidget {
  const QueueView({Key? key}) : super(key: key);

  @override
  State<QueueView> createState() => _QueueViewState();
}

class _QueueViewState extends State<QueueView> {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return StreamProvider<List<Test>>.value(
      initialData: [],
      value: DatabaseService().test,
      child: Scaffold(
        body: const Center(
          child: TestList()
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            debugPrint(DatabaseService().userData.toString());
          },
        child: const Text('+'),
        ),
      ),
    );
  }
}
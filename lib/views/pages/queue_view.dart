import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:puvoms/services/database.dart';

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

    return Scaffold(
      body: const Center(
      child: Text(
          "Queue Page",
          style: TextStyle(
          fontSize: 30.0,
          letterSpacing: 2.0,
          color: Colors.black45,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //Function
          
        },
      child: const Text('+'),
    ),
    );
  }
}
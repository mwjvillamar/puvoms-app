import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/views/widgets/custom_textbutton_widget.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  
  //Firebase Instance
  final AuthService _auth = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    
    

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Account'),
        actions: <Widget>[
          CustomTextButton(
            prompt: "", 
            text: "Signout", 
            color: Colors.white, 
            key: const ValueKey("signout"), 
            size: 16,
          ),
        ],
      ),
      body: Text(""),
    );
  }
}

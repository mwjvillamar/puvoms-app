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
          // TextButton.icon(
          //   label: const Text("Signout"),
          //   icon: const Icon(Icons.logout),
          //   style: 
          //     TextButton.styleFrom(
          //       foregroundColor: Colors.white,
          //   ), 
          //   onPressed: () async {
          //     await _auth.signOut();
          //     //this will send a null state in the stream 
          //   }, 
          // ),
          CustomTextButton(
            prompt: "", 
            text: "Signout", 
            color: Colors.white, 
            key: const ValueKey("signout"), 
            size: 16,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/widgets/custom_textbutton_widget.dart';

class AdminAccountView extends StatefulWidget {
  const AdminAccountView({Key? key}) : super(key: key);

  @override
  State<AdminAccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AdminAccountView> {
  
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

    return Center(
      child: CustomTextButton(
        prompt: "",
        text: "ADMIN Signout",
        color: Colors.blue,
        key: const ValueKey("signout"),
        size: 16,
      ),
    );
  }
}

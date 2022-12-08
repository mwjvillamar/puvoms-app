import 'package:flutter/material.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/widgets/custom_textbutton_widget.dart';

class DriverAccountView extends StatefulWidget {
  const DriverAccountView({Key? key}) : super(key: key);

  @override
  State<DriverAccountView> createState() => _DriverAccountViewState();
}

class _DriverAccountViewState extends State<DriverAccountView> {
  
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
        text: "DRIVER Signout",
        color: Colors.green,
        key: const ValueKey("signout"),
        size: 16,
      ),
    );
  }
}

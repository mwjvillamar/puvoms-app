import 'package:flutter/material.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/widgets/custom_rowitem_widget.dart';
import 'package:puvoms/widgets/custom_textbutton_widget.dart';

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

    return Center(
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('lib/assets/puvoms_logo.png'),
                  fit: BoxFit.fitWidth
                )
              ),
            ),
          ),
          const CustomRowItem(text: 'Full Name: ', icon: Icons.person),
          const CustomRowItem(text: 'Role: ', icon: Icons.account_tree),
          const CustomRowItem(text: 'Phone: ', icon: Icons.phone),
          const CustomRowItem(text: 'Email: ', icon: Icons.email),
          const CustomRowItem(text: 'Vehicle Brand: ', icon: Icons.directions_bus),
          const CustomRowItem(text: 'Vehicle Color: ', icon: Icons.directions_bus),
          const CustomRowItem(text: 'Vehicle License No.: ', icon: Icons.abc),
          CustomTextButton(
            prompt: "",
            text: "ADMIN Signout",
            color: Colors.black,
            key: const ValueKey("signout"),
            size: 16,
          ),
        ],
      )
    );
  }
}

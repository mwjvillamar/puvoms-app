import 'package:flutter/material.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/widgets/custom_button_widget.dart';
import 'package:puvoms/widgets/custom_accountitem_widget.dart';
import 'package:puvoms/widgets/custom_label_widget.dart';

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
        child: Padding(
          padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, 0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 200,
                          minWidth: 200,
                        ),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('lib/assets/puvoms_logo.png'),
                                fit: BoxFit.contain
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: context.mainHP),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomLabel(icon: Icons.person, text: ' Full Name: '),
                        const CustomAccountItem(),
                        const CustomLabel(icon: Icons.account_tree, text: ' Role: '),
                        const CustomAccountItem(),
                        const CustomLabel(icon: Icons.phone, text: ' Phone: '),
                        const CustomAccountItem(),
                        const CustomLabel(icon: Icons.email, text: ' Email: '),
                        const CustomAccountItem(),
                        const CustomLabel(icon: Icons.directions_bus, text: ' Vehicle Brand: '),
                        const CustomAccountItem(),
                        const CustomLabel(icon: Icons.directions_bus, text: ' Vehicle Color: '),
                        const CustomAccountItem(),
                        const CustomLabel(icon: Icons.abc, text: ' Vehicle License No.: '),
                        const CustomAccountItem(),
                      ],
                    ),
                    SizedBox(height: context.mainHP),
                    CustomButton(text: "Save"),
                    CustomButton(text: "Logout", key: const ValueKey("signout"))
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/views/widgets/custom_button_widget.dart';
import 'package:puvoms/views/widgets/custom_label_widget.dart';
import 'package:puvoms/views/widgets/custom_textbutton_widget.dart';
import 'package:puvoms/views/widgets/custom_textfield_widget.dart';

// WIDGET
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

// STATE
class _LoginViewState extends State<LoginView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: Polish -> texts, textfields & button styles

    // Set to true for layout debugging
    debugPaintSizeEnabled = false;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Column(
                      children: [
                        const Expanded(
                            flex: 4,
                            child: Image(
                                image: AssetImage('lib/assets/puvoms_logo.png'),
                                fit: BoxFit.contain
                            )
                        ),
                        SizedBox(height: context.secondaryHP),
                        Expanded(
                            flex: 1,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: const[
                                  Expanded(
                                      flex: 3,
                                      child: FittedBox(
                                          child: Text("Welcome back!")
                                      )
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: FittedBox(
                                          child: Text("Please login to continue.")
                                      )
                                  )
                                ]
                            )
                        )
                      ]
                  )
              ),
              SizedBox(height: context.mainHP),
              Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const CustomLabel(icon: Icons.person, text: ' Username'),
                          const CustomTextField(hint: "Enter your username", icon: Icons.arrow_right_alt),
                          const CustomLabel(icon: Icons.key, text: ' Password'),
                          const CustomTextField(hint: "Enter your password", icon: Icons.arrow_right_alt),
                          const CustomTextButton(prompt: "Don't have an account yet?", text: "Register Here"),
                          SizedBox(height: context.mainHP),
                          const CustomButton(text: "Login"),
                          const CustomButton(text: "Continue as Guest"),
                        ]
                    ),
                  )
              )
            ]
          ),
        )
      ),
    );
  }

}

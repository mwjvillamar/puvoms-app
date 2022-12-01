import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/views/widgets/custom_label_widget.dart';
import 'package:puvoms/views/widgets/custom_textbutton_widget.dart';
import 'package:puvoms/views/widgets/custom_textfield_widget.dart';
import '../widgets/custom_button_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Set to true for layout debugging
    debugPaintSizeEnabled = false;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                            child: Image(
                              image: AssetImage('lib/assets/puvoms_logo.png'),
                              fit: BoxFit.contain,
                            )
                        ),
                        SizedBox(width: context.mainWP),
                        Expanded(
                          flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: const[
                                Expanded(
                                    child: FittedBox(
                                        alignment: Alignment.bottomLeft,
                                        child: Text("Register Account")
                                    )
                                ),
                                Expanded(
                                    child: FittedBox(
                                        alignment: Alignment.topLeft,
                                        child: Text("Please do complete all fields")
                                    )
                                )
                              ],
                            )
                        ),
                        SizedBox(width: context.mainWP),
                      ]
                  )
              ),
              SizedBox(height: context.mainHP),
              Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                          const CustomLabel(icon: Icons.badge, text: " First Name"),
                          const CustomTextField(hint: "Enter your first name", icon: Icons.arrow_right_alt),
                          const CustomLabel(icon: Icons.badge, text: " Last Name"),
                          const CustomTextField(hint: "Enter your last name", icon: Icons.arrow_right_alt),
                          const CustomLabel(icon: Icons.phone, text: " Phone Number"),
                          const CustomTextField(hint: "Enter your phone number", icon: Icons.arrow_right_alt),
                          const CustomLabel(icon: Icons.person, text: " Username"),
                          const CustomTextField(hint: "Enter your username", icon: Icons.arrow_right_alt),
                          const CustomLabel(icon: Icons.key, text: " Password"),
                          const CustomTextField(hint: "Enter your password", icon: Icons.arrow_right_alt),
                          const CustomLabel(icon: Icons.password, text: " Confirm Password"),
                          const CustomTextField(hint: "Confirm your password", icon: Icons.arrow_right_alt),
                          const CustomTextButton(key: ValueKey("redirectToLogin"), prompt: "Already have an account?", text: "Login Here"),
                          SizedBox(height: context.mainHP),
                          CustomButton(text: "Register")
                      ],
                    ),
                  ),
              ),
            ],
          ),
        )
      )
    );
  }
}

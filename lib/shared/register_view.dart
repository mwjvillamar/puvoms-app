import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/shared/load_view.dart';
import 'package:puvoms/widgets/custom_label_widget.dart';
import 'package:puvoms/widgets/custom_text_widget.dart';
import 'package:puvoms/widgets/custom_textbutton_widget.dart';
import 'package:puvoms/widgets/custom_button_widget.dart';
import 'package:puvoms/widgets/custom_textformfield_widget.dart';

class RegisterView extends StatefulWidget {
  
  final toggleView;
  
  const RegisterView({Key? key, this.toggleView,}) : super (key: key);
  
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  
  //firebase instance
  final AuthService _auth = AuthService();
  
  //globalkey
  final _formKey = GlobalKey<FormState>();
  
  //Text Field State?
  String email = "";
  String password = "";
  String error = "";
  
  //for loading widget
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    // Set to true for layout debugging
    debugPaintSizeEnabled = false;
    
    return loading ? LoadView() : Scaffold(
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // const CustomLabel(icon: Icons.badge, text: " First Name"),
                          // const CustomTextField(hint: "Enter your first name", icon: Icons.arrow_right_alt),
                          // const CustomLabel(icon: Icons.badge, text: " Last Name"),
                          // const CustomTextField(hint: "Enter your last name", icon: Icons.arrow_right_alt),
                          // const CustomLabel(icon: Icons.phone, text: " Phone Number"),
                          // const CustomTextField(hint: "Enter your phone number", icon: Icons.arrow_right_alt),
                          const CustomLabel(icon: Icons.person, text: " Email"),
                          CustomTextFormField(
                            key: const ValueKey("register-username"),
                            isHidden: false,
                            hint: "Enter your Email", 
                            icon: Icons.arrow_right_alt,
                            callbackFunction: (val) => setState(() => email = val),
                          ),
                          const CustomLabel(icon: Icons.key, text: " Password"),
                          CustomTextFormField(
                            key: const ValueKey("register-password"),
                            isHidden: true,
                            hint: "Enter your password", 
                            icon: Icons.arrow_right_alt,
                            callbackFunction: (val) => setState(() => password = val),
                          ),
                          const CustomLabel(icon: Icons.password, text: " Confirm Password"),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: ("Confirm your password"),
                              prefixIcon: Icon(Icons.arrow_right_alt),
                              border: OutlineInputBorder(),
                            ),
                            validator: (val) => val! != password ? "Does not Match password" : null,
                          ),
                          CustomTextButton(
                            prompt: "Already have an account?", 
                            text: "Login Here", 
                            key: const ValueKey("authentication"), 
                            toggleView: widget.toggleView, 
                            size: 16,
                          ),
                          CustomText(
                            text: error,
                            color: Colors.red,
                            size: 14,
                          ),
                          CustomButton(
                            text: "Register", 
                            key: const ValueKey("register"), 
                            value: [email, password], 
                            formState: _formKey.currentState, 
                            callbackFunction: (val) => setState(() => error = val),
                            loadingFunction: (val) => setState(() => loading = val),
                          )
                        ],
                      ),
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

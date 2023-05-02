import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/shared/load_view.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/features/login/views/widgets/login_textformfield_widget.dart';
import 'package:puvoms/features/login/views/widgets/login_button_widget.dart';
import 'package:puvoms/features/login/views/widgets/login_textbutton_widget.dart';
import 'package:puvoms/features/login/views/widgets/login_errormessage_widget.dart';

// WIDGET
class LoginView extends StatefulWidget {
  
  final toggleView;
  const LoginView({Key? key, this.toggleView}) : super(key: key);
  
  @override
  State<LoginView> createState() => _LoginViewState();
}

// STATE
class _LoginViewState extends State<LoginView> {
  
  //FIREBASE VARIABLES
  //_ means private variable
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

    
    // TODO: Polish -> texts, textfields & button styles

    // Set to true for layout debugging
    debugPaintSizeEnabled = false;

    return loading ? LoadView() : Scaffold(
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
                                          child: Text("Please login to continue...")
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          LoginTextFormField(
                            key: const ValueKey("login-email"),
                            isHidden: false,
                            hint: "Enter Your E-mail",
                            label: "E-mail",
                            prefixIcon: Icons.email,
                            callbackFunction: (val) => setState(() => email = val)
                          ),
                          SizedBox(height: context.secondaryHP),
                          LoginTextFormField(
                            key: const ValueKey("login-password"),
                            isHidden: true,
                            hint: "Enter Your Password",
                            label: "Password",
                            prefixIcon: Icons.password,
                            callbackFunction: (val) => setState(() => password = val)
                          ),
                          SizedBox(height: context.secondaryHP),
                          LoginTextButton(
                            prompt: "Don't have an account yet?",
                            key: const ValueKey("authentication"),
                            text: "Register Here",
                            toggleView: widget.toggleView,
                            size: 16,
                          ),
                          LoginErrorMessage(
                            text: error,
                            color: Colors.red,
                            size: 14,
                          ),
                          SizedBox(height: context.mainHP),
                          LoginButton(
                            text: "Login", 
                            key: const ValueKey("login"), 
                            value: [email, password],
                            formState: _formKey.currentState,
                            callbackFunction: (val) => setState(() => error = val),
                            loadingFunction: ((val){
                              setState(() {
                                loading = val;
                              });
                            }),
                          ),
                          LoginButton(
                            text: "Continue as Guest", 
                            key: const ValueKey("guest")
                          ),
                        ],
                      ),
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

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/shared/load_view.dart';
import 'package:puvoms/widgets/custom_button_widget.dart';
import 'package:puvoms/widgets/custom_label_widget.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/widgets/custom_text_widget.dart';
import 'package:puvoms/widgets/custom_textformfield_widget.dart';
import 'package:puvoms/widgets/custom_textbutton_widget.dart';

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
                    //Form Widget to get values
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const CustomLabel(icon: Icons.person, text: 'Email', size: 16,),
                          CustomTextFormField(
                            key: const ValueKey("login-username"),
                            isHidden: false,
                            hint: "Enter Your Email", 
                            icon: Icons.arrow_right_alt,
                            callbackFunction: (val) => setState(() => email = val)
                          ),
                          // const CustomLabel(icon: Icons.person, text: ' Username'),
                          // TextFormField(
                          //   decoration: const InputDecoration(
                          //     hintText: ("Enter Your Username"),
                          //     prefixIcon: Icon(Icons.arrow_right_alt),
                          //     border: OutlineInputBorder(),
                          //   ),
                          //   onChanged: (val) {
                          //     setState(() => email = val);
                          //   },
                          //   validator: (val) => val!.isEmpty ? "Enter an Email" : null,
                          // ),
                          const CustomLabel(icon: Icons.key, text: ' Password', size: 16,),
                          CustomTextFormField(
                            key: const ValueKey("login-password"),
                            isHidden: true,
                            hint: "Enter Your Password", 
                            icon: Icons.arrow_right_alt,
                            callbackFunction: (val) => setState(() => password = val)
                            ),
                          CustomTextButton(
                            prompt: "Don't have an account yet?",
                            key: const ValueKey("authentication"),
                            text: "Register Here",
                            toggleView: widget.toggleView,
                            size: 16,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(10),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       const Text(
                          //         "Don't have an account yet?",
                          //         style: TextStyle(fontSize: 16)
                          //       ),
                          //       TextButton(
                          //         onPressed: () {
                          //           widget.toggleView();
                          //         }, 
                          //         child: const Text(
                          //           "Register Here",
                          //            style: TextStyle(fontSize: 16)
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: context.mainHP),
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     shape: const RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.all(Radius.circular(18))
                          //     )
                          //   ),
                          //   onPressed: () async {
                          //     if (_formKey.currentState!.validate()){
                          //       dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                          //       if(result is String){
                          //         setState(() => error = result);
                          //       }
                          //     }
                          //   },
                          //   child: const Text(
                          //     'Login',
                          //     style: TextStyle(fontSize: 16),
                          //   ),
                          // ),
                          // const SizedBox(height: 5.0,),
                          CustomText(
                            text: error,
                            color: Colors.red,
                            size: 14,
                          ),
                          CustomButton(
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
                          CustomButton(
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

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/shared/load_view.dart';
import 'package:puvoms/widgets/custom_dropdown_widget.dart';
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
  
  String firstName = "";
  String lastName = "";
  String role = "admin";
  String phoneNum = "";
  
  String vehicleBrand = "";
  String vehicleColor = "";
  String plateNumber = "";
    
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
                          const CustomLabel(icon: Icons.account_circle_rounded, text: " First Name"),
                          CustomTextFormField(
                            key: const ValueKey("register-firstName"),
                            isHidden: false,
                            hint: "Enter your First Name", 
                            icon: Icons.arrow_right_alt,
                            callbackFunction: (val) => setState(() => firstName = val),
                          ),
                          const CustomLabel(icon: Icons.account_circle_rounded, text: " Last Name"),
                          CustomTextFormField(
                            key: const ValueKey("register-lastName"),
                            isHidden: false,
                            hint: "Enter your Last Name", 
                            icon: Icons.arrow_right_alt,
                            callbackFunction: (val) => setState(() => lastName = val),
                          ),
                          const CustomLabel(icon: Icons.phone, text: " Phone Number"),
                          CustomTextFormField(
                            key: const ValueKey("register-phoneNum"),
                            isHidden: false,
                            hint: "Enter your phone number", 
                            icon: Icons.arrow_right_alt,
                            callbackFunction: (val) => setState(() => phoneNum = val),
                          ),
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
                          const CustomLabel(icon: Icons.badge, text: " Role - For Testing"),
                          CustomDropwdownButton(
                            list: const ['Passenger', 'Driver', 'Admin'],
                            callbackFunction: (val) {
                              setState(() {
                                role = val;
                                debugPrint(role);
                              });
                            },
                          ),
                          if (role == "Driver") ... [
                            const CustomLabel(icon: Icons.person, text: " Vehicle Brand"),
                            CustomTextFormField(
                              key: const ValueKey("register-vehicleBrand"),
                              isHidden: false,
                              hint: "Enter Your Vehicle Brand", 
                              icon: Icons.directions_bus,
                              callbackFunction: (val) => setState(() => vehicleBrand = val),       
                            ),
                            const CustomLabel(icon: Icons.person, text: " Vehicle Color"),
                            CustomTextFormField(
                              key: const ValueKey("register-vehicleColor"),
                              isHidden: false,
                              hint: "Enter Your Vehicle Brand", 
                              icon: Icons.directions_bus,
                              callbackFunction: (val) => setState(() => vehicleColor = val),       
                            ),
                            const CustomLabel(icon: Icons.person, text: " Plate Number:"),
                            CustomTextFormField(
                              key: const ValueKey("register-plateNumber"),
                              isHidden: false,
                              hint: "Enter Your Vehicle Brand", 
                              icon: Icons.abc,
                              callbackFunction: (val) => setState(() => plateNumber = val),       
                            ),
                          ],
                          const SizedBox(height: 10,),
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
                            // value: [email, password, firstName, lastName, role, phoneNum],
                            value: {
                              'email' : email,
                              'password' : password,
                              'firstName' : firstName,
                              'lastName' : lastName,
                              'role' : role,
                              'phoneNum' : phoneNum,
                              'vehicleBrand' : vehicleBrand,
                              'vehicleColor' : vehicleColor,
                              'plateNumber' : plateNumber
                            },
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

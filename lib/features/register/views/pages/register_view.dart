import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/shared/load_view.dart';
import 'package:puvoms/widgets/custom_dropdown_widget.dart';
import 'package:puvoms/features/register/views/widgets/register_textformfield_widget.dart';
import 'package:puvoms/features/register/views/widgets/register_button_widget.dart';
import 'package:puvoms/features/register/views/widgets/register_textbutton_widget.dart';
import 'package:puvoms/features/register/views/widgets/register_errormessage_widget.dart';
import 'package:puvoms/widgets/custom_label_widget.dart';

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
  String role = "passenger";
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
                                        child: Text("REGISTER ACCOUNT")
                                    )
                                ),
                                Expanded(
                                    child: FittedBox(
                                        alignment: Alignment.topLeft,
                                        child: Text("Please do complete all fields...")
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
                          RegisterTextFormField(
                            key: const ValueKey("register-firstName"),
                            isHidden: false,
                            hint: "Enter your first name",
                            label: "First Name",
                            prefixIcon: Icons.person,
                            callbackFunction: (val) => setState(() => firstName = val),
                          ),
                          SizedBox(height: context.secondaryHP),
                          RegisterTextFormField(
                            key: const ValueKey("register-lastName"),
                            isHidden: false,
                            hint: "Enter your last name",
                            label: "Last Name",
                            prefixIcon: Icons.person,
                            callbackFunction: (val) => setState(() => lastName = val),
                          ),
                          SizedBox(height: context.secondaryHP),
                          RegisterTextFormField(
                            key: const ValueKey("register-phoneNum"),
                            isHidden: false,
                            hint: "Enter your phone number",
                            label: "Phone Number",
                            prefixIcon: Icons.phone,
                            callbackFunction: (val) => setState(() => phoneNum = val),
                          ),
                          SizedBox(height: context.secondaryHP),
                          RegisterTextFormField(
                            key: const ValueKey("register-email"),
                            isHidden: false,
                            hint: "Enter your e-mail",
                            label: "E-mail",
                            prefixIcon: Icons.account_circle,
                            callbackFunction: (val) => setState(() => email = val),
                          ),
                          SizedBox(height: context.secondaryHP),
                          RegisterTextFormField(
                            key: const ValueKey("register-password"),
                            isHidden: true,
                            hint: "Enter your password",
                            label: "Password",
                            prefixIcon: Icons.password,
                            callbackFunction: (val) => setState(() => password = val),
                          ),
                          SizedBox(height: context.secondaryHP),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: ("Confirm your password"),
                              label: Text("Confirm Password"),
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(),
                            ),
                            validator: (val) => val! != password ? "Does not Match password" : null,
                          ),
                          SizedBox(height: context.secondaryHP),
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
                            SizedBox(height: context.secondaryHP),
                            RegisterTextFormField(
                              key: const ValueKey("register-vehicleBrand"),
                              isHidden: false,
                              hint: "Enter your vehicle brand",
                              label: "Vehicle Brand",
                              prefixIcon: Icons.directions_car,
                              callbackFunction: (val) => setState(() => vehicleBrand = val),       
                            ),
                            SizedBox(height: context.secondaryHP),
                            RegisterTextFormField(
                              key: const ValueKey("register-vehicleColor"),
                              isHidden: false,
                              hint: "Enter your vehicle color",
                              label: "Vehicle Color",
                              prefixIcon: Icons.color_lens,
                              callbackFunction: (val) => setState(() => vehicleColor = val),       
                            ),
                            SizedBox(height: context.secondaryHP),
                            RegisterTextFormField(
                              key: const ValueKey("register-plateNumber"),
                              isHidden: false,
                              hint: "Enter your plate number",
                              label: "Plate Number",
                              prefixIcon: Icons.numbers,
                              callbackFunction: (val) => setState(() => plateNumber = val),       
                            ),
                          ],
                          SizedBox(height: context.secondaryHP),
                          RegisterTextButton(
                            prompt: "Already have an account?", 
                            text: "Login Here", 
                            key: const ValueKey("authentication"), 
                            toggleView: widget.toggleView, 
                            size: 16,
                          ),
                          RegisterErrorMessage(
                            text: error,
                            color: Colors.red,
                            size: 14,
                          ),
                          SizedBox(height: context.mainHP),
                          RegisterButton(
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

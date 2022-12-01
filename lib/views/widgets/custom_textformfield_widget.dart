import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {

  final String hint;
  final IconData icon;
  // final String val;
  
  final String? email;
  final String? password;
  
  final bool isHidden;
  
  final callbackFunction;

  const CustomTextFormField({
    Key? key,
    
    required this.isHidden,
    required this.hint,
    required this.icon,
    this.email,
    this.password,
    // required this.val
    
    this.callbackFunction,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: widget.isHidden,
        decoration: InputDecoration(
          hintText: widget.hint,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(widget.icon),
        ),
        style: const TextStyle(fontSize: 16),
        onChanged: (val) => widget.callbackFunction(val),
        validator: ((val) {
          if (widget.key == const ValueKey("login-username")){
            if (val!.isEmpty){
              return("Enter a valid Email");
            } else {
              return null;
            }
          } else if (widget.key == const ValueKey("login-password")){
            if (val!.isEmpty){
              return("Enter a valid Password");
            } else {
              return null;
            }
          } else if (widget.key == const ValueKey("register-username")){
            if (val!.isEmpty){
              return("Enter a valid Email");
            } else {
              return null;
            }
          } else if (widget.key == const ValueKey("register-password")){
            if (val!.isEmpty){
              return("Enter a valid Password");
            } else if (val.length < 6){
              return("Enter a password with more than 6 characters.");
            } else {
              return null;
            }
          } else if (widget.key == const ValueKey("register-confirm")){
            if (val! != widget.callbackFunction(val)){
              return("Does not Match password");
            } else {
              return null;
            }
          }
          return null;
        }),
        // validator: (val) => ,
    );
  }
}
import 'package:flutter/material.dart';

class LoginTextFormField extends StatefulWidget {

  final IconData prefixIcon;
  final String hint;
  final String label;
  final String? email;
  final String? password;
  
  final bool isHidden;
  
  final callbackFunction;

  const LoginTextFormField({
    Key? key,
    
    required this.isHidden,
    required this.hint,
    required this.label,
    required this.prefixIcon,
    this.email,
    this.password,
    
    required this.callbackFunction,
  }) : super(key: key);

  @override
  State<LoginTextFormField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextFormField> {
  
  validateMobile(String value) {
    String pattern = r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{4}[-\s\.]?[0-9]{4}[-\s\.]?[0-9]{4,6}$)';
    RegExp regExp = new RegExp(pattern);

    if (value.isEmpty == 0) {
          return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number: +(00)-000-000-0000';
    }
    return null;
  }
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: widget.isHidden,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon),
          hintText: widget.hint,
          label: Text(widget.label),
          border: const OutlineInputBorder(),
        ),
        style: const TextStyle(fontSize: 16),
        onChanged: (val) => widget.callbackFunction(val),
        validator: ((val) {
          if (widget.key == const ValueKey("login-email")) {
            if (val!.isEmpty) {
              return("Enter a valid E-mail");
            } else {
              return null;
            }
          } else if (widget.key == const ValueKey("login-password")) {
            if (val!.isEmpty) {
              return("Enter a valid Password");
            } else {
              return null;
            }
          }
          return null;
        }),
    );
  }
}
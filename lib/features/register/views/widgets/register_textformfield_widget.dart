import 'package:flutter/material.dart';

class RegisterTextFormField extends StatefulWidget {

  final IconData prefixIcon;
  final String hint;
  final String label;
  final String? email;
  final String? password;

  final bool isHidden;

  final callbackFunction;

  const RegisterTextFormField({
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
  State<RegisterTextFormField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextFormField> {

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
        if (widget.key == const ValueKey("register-firstName")){
          if (val!.isEmpty){
            return("Enter a valid Name");
          } else {
            return null;
          }
        } else if (widget.key == const ValueKey("register-lastName")){
          if (val!.isEmpty){
            return("Enter a valid Last Name");
          } else {
            return null;
          }
        } else if (widget.key == const ValueKey("register-phoneNum")){
          // validateMobile(val!);
          if (val!.isEmpty){
            return("Enter a valid Phone Number");
          } else {
            return null;
          }
        } else if (widget.key == const ValueKey("register-email")){
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
        } else if (widget.key == const ValueKey("register-vehicleBrand")){
          if (val!.isEmpty){
            return("Enter your Vehicle Brand");
          } else {
            return null;
          }
        } else if (widget.key == const ValueKey("register-vehicleColor")){
          if (val!.isEmpty){
            return("Enter your Vehicle Color");
          } else {
            return null;
          }
        } else if (widget.key == const ValueKey("register-plateNum")){
          if (val!.isEmpty){
            return("Enter your Plate Number");
          } else {
            return null;
          }
        }
        return null;
      }),
    );
  }
}
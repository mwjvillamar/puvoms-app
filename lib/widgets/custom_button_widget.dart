import 'package:flutter/material.dart';
import 'package:puvoms/services/auth.dart';

class CustomButton extends StatelessWidget {
  
  //FIREBASE VARIABLES
  //_ means private variable
  final AuthService _auth = AuthService();

  // final Function function;
  final String text;
  
  final value;
  final callbackFunction;
  final loadingFunction;
  
  final testValue;
  
  final formState;
  
  CustomButton({
    Key? key,
    // required this.function,
    required this.text,
    this.value,
    this.testValue,
    
    this.formState,
    
    this.callbackFunction,
    this.loadingFunction,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18))
            )
        ),
        onPressed: () async {
          if (key == const ValueKey("login")){
            try {
              if (formState.validate()){
                loadingFunction(true);
                debugPrint("Test Value: $testValue");
                dynamic result = await _auth.signInWithEmailAndPassword(value[0], value[1]);
                if (result is String){
                  callbackFunction!(result);
                  loadingFunction(false);
                  debugPrint("Test Value: $testValue");
                }
              }
            } catch (e) {
              debugPrint("Form State is Null \n E: $e");
            }
          } else if (key == const ValueKey("guest")){
            debugPrint("Guest Login");
            //calling anonymous sign-in method
            dynamic result = await _auth.signInAnon();
            if(result == null) {
              debugPrint('Error Signing In');
            } else {
              debugPrint('Signed In');
              debugPrint(result.uid.toString());
            }
          } else if (key == const ValueKey("register")) {
            try {
              if (formState.validate()){
                loadingFunction(true);
              dynamic result = await _auth.registerWithEmailAndPassword(value[0], value[1], value[2], value[3], value[4], value[5]);
                if (result is String){
                  callbackFunction!(result);
                  loadingFunction(false);
                }
              }
            } catch (e) {
              debugPrint("Form State is Null \n E: $e"); 
            }
          } else {
            debugPrint("No Button");
          }
        },
        child: Text(
            text,
            style: const TextStyle(fontSize: 16)
        )
    );
  }
}

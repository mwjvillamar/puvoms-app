import 'package:flutter/material.dart';
import 'package:puvoms/services/auth.dart';

class CustomButton extends StatelessWidget {
  
  //FIREBASE VARIABLES
  //_ means private variable
  final AuthService _auth = AuthService();

  // final Function function;
  final String text;

  CustomButton({
    Key? key,
    // required this.function,
    required this.text,
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
          debugPrint("Test Press");
          //calling anonymous sign-in method
          dynamic result = await _auth.signInAnon();
          if(result == null) {
            debugPrint('Error Signing In');
          } else {
            debugPrint('Signed In');
            debugPrint(result.uid.toString());
          }
        },
        child: Text(
            text,
            style: const TextStyle(fontSize: 16)
        )
    );
  }
}

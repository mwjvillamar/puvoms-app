import 'package:flutter/material.dart';
import 'package:puvoms/services/auth.dart';

class LoginTextButton extends StatelessWidget{
  
  //FIREBASE VARIABLES
  //_ means private variable
  final AuthService _auth = AuthService();

  final String prompt;
  final String text;
  
  final Function? toggleView;
  
  final Color? color;
  
  final IconData? icon;
  
  final double? size;
  
  LoginTextButton({
    Key? key,
    required this.prompt,
    required this.text,
    this.toggleView,
    this.color,
    this.icon,
    this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  prompt,
                  style: TextStyle(fontSize: size)
              ),
              TextButton(
                  onPressed: () async {
                    if(key == const ValueKey("authentication")){
                      debugPrint("Switch Authentication View");
                      toggleView!();
                    } else if(key == const ValueKey("signout")){
                      _auth.signOut();
                      debugPrint(DateTime.now().toString());
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: color,
                  ),
                  child: Text(
                      text,
                      style: TextStyle(fontSize: size)
                  ),
              )
            ]
        )
    );
  }
}
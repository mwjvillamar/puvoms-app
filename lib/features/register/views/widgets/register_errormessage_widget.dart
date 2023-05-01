import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterErrorMessage extends StatelessWidget {
  
  final String? text;
  final Color? color;
  final double? size;
  
  const RegisterErrorMessage({
    Key? key,
    
    this.text,
    this.color,
    this.size,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color!,
        fontSize: size!
      ),
    );
  }
}
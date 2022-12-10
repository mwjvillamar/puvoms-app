import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {

  final IconData icon;
  final String text;
  final double size;

  const CustomLabel({
    Key? key,
    required this.size,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2),
        child: Text.rich(
            TextSpan(
                style: TextStyle(fontSize: size),
                children: [
                  WidgetSpan(child: Icon(icon)),
                  TextSpan(text: text,)
                ]
            )
        )
    );
  }
}

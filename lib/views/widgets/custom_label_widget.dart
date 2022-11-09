import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {

  final IconData icon;
  final String text;

  const CustomLabel({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Text.rich(
            TextSpan(
                style: const TextStyle(fontSize: 16),
                children: [
                  WidgetSpan(child: Icon(icon)),
                  TextSpan(text: text)
                ]
            )
        )
    );
  }
}

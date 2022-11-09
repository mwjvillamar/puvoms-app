import 'package:flutter/material.dart';

class CustomCardButton extends StatelessWidget {

  final IconData icon;
  final String text;

  const CustomCardButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: InkWell(
          onTap: () {},
          child: FittedBox(
            child: Column(
              children: [
                Icon(icon),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(text)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
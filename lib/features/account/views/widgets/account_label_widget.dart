import 'package:flutter/material.dart';

class AccountLabel extends StatelessWidget {

  final IconData icon;
  final String text;

  const AccountLabel({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            Expanded(
              child: Text(text,
                maxLines: 16,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            )
          ],
        )
        // child: Text.rich(
        //     TextSpan(
        //         style: const TextStyle(fontSize: 16),
        //         children: [
        //           WidgetSpan(child: Icon(icon)),
        //           TextSpan(text: text)
        //         ]
        //     )
        // )
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  final String prompt;
  final String text;

  const CustomTextButton({
    Key? key,
    required this.prompt,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  prompt,
                  style: const TextStyle(fontSize: 16)
              ),
              TextButton(
                  onPressed: () {
                    if(key == const ValueKey("redirectToLogin")) {
                      // TODO: Implement onPressed method
                    }
                    else if(key == const ValueKey("redirectToRegister")) {
                      // TODO: Implement onPressed method
                    }
                    else
                    {
                      // TODO: Implement onPressed method
                    }
                  },
                  child: Text(
                      text,
                      style: const TextStyle(fontSize: 16)
                  )
              )
            ]
        )
    );
  }
}
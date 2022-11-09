import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  // final Function function;
  final String text;

  const CustomButton({
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
        onPressed: () {
          // function;
          // TODO: implement "btGuest" action
        },
        child: Text(
            text,
            style: const TextStyle(fontSize: 16)
        )
    );
  }
}

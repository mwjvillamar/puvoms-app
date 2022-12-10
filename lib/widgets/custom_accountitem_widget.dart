import 'package:flutter/material.dart';
import 'package:puvoms/constants/material_constant.dart';

class CustomAccountItem extends StatefulWidget {

  const CustomAccountItem({Key? key}) : super(key: key);

  @override
  State<CustomAccountItem> createState() => _CustomAccountItemState();
}

class _CustomAccountItemState extends State<CustomAccountItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              // TODO: implement onPressed function
            },
            icon: const Icon(Icons.edit)
        )
      ],
    );
  }
}

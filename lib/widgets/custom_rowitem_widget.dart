import 'package:flutter/material.dart';
import 'package:puvoms/constants/material_constant.dart';

class CustomRowItem extends StatefulWidget {

  const CustomRowItem({Key? key}) : super(key: key);

  @override
  State<CustomRowItem> createState() => _CustomRowItemState();
}

class _CustomRowItemState extends State<CustomRowItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: TextFormField
          (
            enabled: false,
            decoration: InputDecoration
            (
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

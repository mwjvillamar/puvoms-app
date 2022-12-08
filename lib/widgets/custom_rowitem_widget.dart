import 'package:flutter/material.dart';

class CustomRowItem extends StatefulWidget {

  final String text;
  final IconData icon;

  const CustomRowItem({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  State<CustomRowItem> createState() => _CustomRowItemState();
}

class _CustomRowItemState extends State<CustomRowItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon),
        Text(widget.text),
        const Expanded(
          child: TextField(),
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

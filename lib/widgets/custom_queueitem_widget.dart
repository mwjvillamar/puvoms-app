import 'package:flutter/material.dart';
import 'package:puvoms/widgets/custom_label_widget.dart';

class CustomQueueItem extends StatefulWidget {

  final String text;
  final IconData icon;

  const CustomQueueItem({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  State<CustomQueueItem> createState() => _CustomQueueItemState();
}

class _CustomQueueItemState extends State<CustomQueueItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child: CustomLabel(
                  icon: widget.icon,
                  text: widget.text
              )
          ),
          Expanded(
            flex: 2,
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              )
          )
        ],
      ),
    );
  }
}

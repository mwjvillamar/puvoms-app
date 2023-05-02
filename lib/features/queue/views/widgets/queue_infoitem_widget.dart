import 'package:flutter/material.dart';

class QueueInfoItem extends StatefulWidget {

  final String text;
  final IconData icon;
  
  final value;

  const QueueInfoItem({Key? key, required this.text, required this.icon, this.value}) : super(key: key);

  @override
  State<QueueInfoItem> createState() => _QueueInfoItemState();
}

class _QueueInfoItemState extends State<QueueInfoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(widget.icon),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          widget.text,
                          maxLines: 16,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  )
              ),
          ),
          Expanded(
              flex: 2,
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: widget.value,
                  hintStyle: const TextStyle(color: Colors.black),
                  border: const OutlineInputBorder()
                ),
              )
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RegisterDropdown extends StatefulWidget {
  
  final List<String> list;
  final callbackFunction;
  
  const RegisterDropdown({
    Key? key,
    required this.list,
    this.callbackFunction
  }) : super(key: key);

  @override
  State<RegisterDropdown> createState() => _RegisterDropdownState();
}

class _RegisterDropdownState extends State<RegisterDropdown> {
  
  
  @override
  Widget build(BuildContext context) {   
    String dropdownValue = widget.list.first;
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_up),
      iconSize: 16,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      // underline: Container(
      //   height: 1,
      //   color: Colors.black,
      // ),
      onChanged: (value) {
        widget.callbackFunction(value);
        setState(() {
          dropdownValue = value!;
        });
      },
      validator: (value) {
        if(value!.isEmpty){
          return ("Select a Proper Role");
        } else {
          return null;
        }
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center (
            child: Text(
            value,
            style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      }).toList(),
    );
  }
}
import 'package:flutter/material.dart';

class CustomAccountItem extends StatefulWidget {
  
  final value;
  final callbackFunction;

  const CustomAccountItem({
    Key? key,
    this.value,
    this.callbackFunction
  }) : super(key: key);

  @override
  State<CustomAccountItem> createState() => _CustomAccountItemState();
}

class _CustomAccountItemState extends State<CustomAccountItem> {
  
  bool isEditing = false;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: TextFormField(
            enabled: isEditing,
            style: const TextStyle(fontSize: 18, color: Colors.green),
            decoration: InputDecoration
            (
              hintText: widget.value,
              hintStyle: const TextStyle(fontSize: 17, color: Colors.black54),
              enabledBorder:  const OutlineInputBorder(),
              disabledBorder: InputBorder.none,
              errorStyle: TextStyle(color: Theme.of(context).errorColor)
            ),
            onChanged: ((val){
              if(widget.key == const ValueKey("account-name")){
                widget.callbackFunction(val.split(" "));
                // debugPrint(val.toString());
              } else {
                widget.callbackFunction(val);
                // debugPrint(val.toString());
              }
            }),
            validator: ((val){
              if(widget.key == const ValueKey("account-name")){
                String pattern = r'^\s*[0-9a-zA-Z]+[ ][0-9a-zA-z]+\s*';
                RegExp regExp = RegExp(pattern);
                if (val!.isEmpty){
                  return "Enter a valid Full Name";
                } else if(!regExp.hasMatch(val)){
                  return "Please add a space between your First and Last Name";
                } else {
                 return null;
                }
              } else if (widget.key == const ValueKey("account-phoneNum")){
                if (val!.isEmpty){
                  return("Enter a valid Phone Number");
                } else {
                  return null;
                }
              } else if (widget.key == const ValueKey("account-vehicleBrand")){
                if (val!.isEmpty){
                  return("Enter a valid Vehicle Brand");
                } else {
                  return null;
                }
              } else if (widget.key == const ValueKey("account-vehicleColor")){
                if (val!.isEmpty){
                  return("Enter a valid Vehicle Color");
                } else {
                  return null;
                }
              } else if (widget.key == const ValueKey("account-plateNumber")){
                if (val!.isEmpty){
                  return("Enter a valid Plate Number");
                } else {
                  return null;
                }
              }
              return null;
            }),
          ),
        ),
        IconButton(
            onPressed: () {
              // TODO: implement onPressed function
              setState(() {
                isEditing = !isEditing;
              });
            },
            icon: isEditing? const Icon(Icons.check): const Icon(Icons.edit)
        )
      ],
    );
  }
}

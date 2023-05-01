import 'package:flutter/material.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/services/database.dart';

class RegisterButton extends StatelessWidget {
  
  //FIREBASE VARIABLES
  //_ means private variable
  final AuthService _auth = AuthService();

  // final Function function;
  final String text;
  final value;
  final callbackFunction;
  final loadingFunction;
  final testValue;
  final formState;
  
  RegisterButton({
    Key? key,
    required this.text,
    this.value,
    this.testValue,
    this.formState,
    this.callbackFunction,
    this.loadingFunction,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final today = DateTime.now();
    final fiftyDaysFromNow = today.add(const Duration(days: 360));
    
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18))
            )
        ),
        onPressed: () async {
          if (key == const ValueKey("login")){
            try {
              if (formState.validate()){
                loadingFunction(true);
                debugPrint("Test Value: $testValue");
                dynamic result = await _auth.signInWithEmailAndPassword(value[0], value[1]);
                if (result is String){
                  callbackFunction!(result);
                  loadingFunction(false);
                  debugPrint("Test Value: $testValue");
                }
              }
            } catch (e) {
              debugPrint("Form State is Null \n E: $e");
            }
          } else if (key == const ValueKey("guest")){
            debugPrint("Guest Login");
            //calling anonymous sign-in method
            dynamic result = await _auth.signInAnon();
            if(result == null) {
              debugPrint('Error Signing In');
            } else {
              debugPrint('Signed In');
              debugPrint(result.uid.toString());
            }
          } else if (key == const ValueKey("register")) {
            try {
              if (formState.validate()){
                loadingFunction(true);
              dynamic result = await _auth.registerWithEmailAndPassword(
                value['email'], 
                value['password'], 
                value['firstName'], 
                value['lastName'], 
                value['role'], 
                value['phoneNum'], 
                value['plateNumber'],
                value['vehicleBrand'],
                value['vehicleColor']
                );
                if (result is String){
                  callbackFunction!(result);
                  loadingFunction(false);
                }
              }
            } catch (e) {
              debugPrint("Form State is Null \n E: $e"); 
            }
          } else if(key == const ValueKey("signout")){
            try {
              await DatabaseService(uid: value['uid']).updateQueue(value['uid'], false, fiftyDaysFromNow, value['firstName'], value['lastName'], value['plateNumber'], 0);
              await DatabaseService(uid: value['uid']).updateVehicle(value['uid'], fiftyDaysFromNow);
              await DatabaseService(uid: value['uid']).updateCoordinate(value['uid'], false);
              _auth.signOut();
            } catch (e) {
              debugPrint("User isn't a Driver");
              _auth.signOut();
            }
          } else if (key == const ValueKey("queue-driver")) {
            if(value['inQueue'] == null){
                await DatabaseService(uid: value['uid']).updateQueue(value['uid'], true, today, value['firstName'], value['lastName'], value['plateNumber'], 0);
            } else {
              if(!value['inQueue']){
                callbackFunction(Colors.blueAccent);
                await DatabaseService(uid: value['uid']).updateQueueStatus(value['uid'], true, today, value['firstName'], value['lastName'], value['plateNumber']);
                await DatabaseService(uid: value['uid']).updateVehicle(value['uid'], today);
                await DatabaseService(uid: value['uid']).updateCoordinate(value['uid'], true);
              } else {
                // await DatabaseService(uid: value['uid']).updateQueueStatus(value['uid'], false, fiftyDaysFromNow, value['firstName'], value['lastName'], value['plateNumber']);
                callbackFunction(Colors.black);
                await DatabaseService(uid: value['uid']).updateQueue(value['uid'], false, fiftyDaysFromNow, value['firstName'], value['lastName'], value['plateNumber'], 0);
                await DatabaseService(uid: value['uid']).updateVehicle(value['uid'], fiftyDaysFromNow);
                await DatabaseService(uid: value['uid']).updateCoordinate(value['uid'], false);
              }
            }
            debugPrint(value.toString());
            debugPrint(value['queueTime'].toString());
            
          } else if (key == const ValueKey("driver-account-save")) {
            try {
              if (formState.validate()){
                await DatabaseService(uid: value['uid']).updateUser(value['uid'], value['firstName'], value['lastName'], value['phoneNum']);
                await DatabaseService(uid: value['uid']).createVehicle(value['uid'], value['vehicleBrand'], value['vehicleColor'], value['plateNumber'], today);
                // await DatabaseService(uid: value[0]).createVehicle(value[0], value[4], value[5], value[6]);
                // await DatabaseService(uid: value[0]).updateUser(value[0], value[1], value[2], value[3]);
                debugPrint(value.toString());
              }
            } catch (e){
              debugPrint("Something went wrong with Account View \n Account View error: $e"); 
            }
          } else if (key == const ValueKey("account-save")) {
            try {
              if (formState.validate()){
                await DatabaseService(uid: value['uid']).updateUser(value['uid'], value['firstName'], value['lastName'], value['phoneNum']);
                // await DatabaseService(uid: value['uid']).createVehicle(value['uid'], value['vehicleBrand'], value['vehicleColor'], value['plateNumber']);
                // await DatabaseService(uid: value[0]).updateUser(value[0], value[1], value[2], value[3]);
                debugPrint(value.toString());
              }
            } catch (e){
              debugPrint("Something went wrong with Admin Account View \n Admin Account View error: $e"); 
            }
          } else {
            debugPrint("No Button");
          }
        },
        child: Text(
            text,
            style: const TextStyle(fontSize: 16)
        )
    );
  }
}

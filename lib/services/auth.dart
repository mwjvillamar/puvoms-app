import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/services/database.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //User Object from Firebase User to our Model
  UserObject? _userFromFirebaseUser(User user){
    return user != null ? UserObject(uid: user.uid) : null;
  }
  
  // Auth Change Listener Stream
  // Check Null Safety Always, I have no idea as well
  // Map will translate all Firebase User to a Normal User from our Model
  Stream<UserObject?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }
  
  //Sign In Anonymously
  //AuthResult is deprecated, it is now UserCredential
  //Same goes with FirebaseUser, it is simply User
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      //add ! to end to, shorthand for it is not null
      User user = userCredential.user!;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "operation-not-allowed":
            debugPrint("Anonymous auth hasn't been enabled for this project.");
          break;
          default:
            debugPrint(e.toString());
        }
    }
  }
  //Sign In with Email and Password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user!;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e){
      debugPrint(e.toString());
      return e.message;
    }
  }

  //Register with Email and Password
  Future registerWithEmailAndPassword(
    String email, 
    String password, 
    String firstName, 
    String lastName, 
    String role, 
    String phoneNum,
    String plateNumber, 
  ) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user!;
      
      //Create a document for the user with the UID
      await DatabaseService(uid: user.uid).updateUserData('1111', 'Dwight Nowards', false, 15);
      
      //Creating a document for the user data
      await DatabaseService(uid: user.uid).createUser(user.uid, firstName, lastName, role, phoneNum, email);
      
      try {
        if (role == "Driver"){
          await DatabaseService(uid: user.uid).updateQueue(user.uid, false, DateTime.now(), firstName, lastName, plateNumber, 0);
        }
      } catch (e) {
        debugPrint("User most likely isn't a Driver \n Error: $e");
      }
      
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e){
      debugPrint(e.toString());
      return e.message;
    }
  }

  //Sign Out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

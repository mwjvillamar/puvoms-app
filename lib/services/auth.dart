import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:puvoms/models/user_model.dart';

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

  //Register with Email and Password

  //Sign Out
}

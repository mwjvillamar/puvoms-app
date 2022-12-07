import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:puvoms/models/test_model.dart';
import 'package:puvoms/models/user_collection_model.dart';
import 'package:puvoms/models/user_model.dart';

class DatabaseService {
  
  //Constructor for the Unique ID
  final String? uid;
  DatabaseService({this.uid});
  
  //Collection Reference
  final CollectionReference testCollection = FirebaseFirestore.instance.collection("test");
  
  //reference to the users collections
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
  
  Future updateUserData(String plateNumber, String driverName, bool inQueue, int passengerCount) async {
    return await testCollection.doc(uid).set({
      'plateNumber' : plateNumber,
      'driverName' : driverName,
      'inQueue' : inQueue,
      'passengerCount' : passengerCount,
    });
  }
  
  Future createUser(String uid, String name, String role, String phoneNum, String email) async {
    return await userCollection.doc(uid).set({
      'uid' : uid,
      'name' : name,
      'role' : role,
      'phoneNum' : phoneNum,
      'email' : email
    });
  }
  
  //get list from snapshot
  List<Test> _testListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
     return Test(
      plateNumber: doc.get('plateNumber') ?? " ",
      driverName: doc.get('driverName') ?? " ",
      inQueue: doc.get('inQueue') ?? false,
      passengerCount: doc.get('passengerCount') ?? 0
     );
    }).toList();
  }
  
  //creating a list from the snapshot
  List<UserCollection> _usersListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return UserCollection(
        uid: doc.get('uid') ?? " ", 
        name: doc.get('name') ?? " ", 
        role: doc.get('role') ?? " ", 
        phoneNum: doc.get('phoneNum') ?? " ", 
        email: doc.get('email') ?? " "
      );
    }).toList();
  }
  
  //userDAta from snapshot
  UserData  _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid!, 
      name: snapshot.get("name"), 
      role: snapshot.get("role"), 
      phoneNum: snapshot.get("phoneNum"), 
      email: snapshot.get("email")
    );
  }
  
  //get collection stream
  Stream<List<Test>> get test {
    return testCollection.snapshots()
    .map(_testListFromSnapshot);
  }
  
  //A stream which constantly listens to user data collection
  Stream<List<UserCollection>> get getUsers{
    return userCollection.snapshots()
    .map(_usersListFromSnapshot);
  }
  
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
  
  
}
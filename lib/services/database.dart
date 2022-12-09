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
  
  //reference to the queue collections
  final CollectionReference queueCollection = FirebaseFirestore.instance.collection("queue");
  
  Future updateUserData(String plateNumber, String driverName, bool inQueue, int passengerCount) async {
    return await testCollection.doc(uid).set({
      'plateNumber' : plateNumber,
      'driverName' : driverName,
      'inQueue' : inQueue,
      'passengerCount' : passengerCount,
    });
  }
  
  Future updateQueue(String uid, bool inQueue, DateTime queueStart, String firstName, String lastName, String plateNumber, int passengerCount) async {
    return await queueCollection.doc(uid).set({
      'uid' : uid,
      'inQueue' : inQueue,
      'queueStart' : queueStart,
      'firstName' : firstName,
      'lastName' : lastName,
      'plateNumber' : plateNumber,
      'passengerCount' : passengerCount
    });
  }
  
  Future createUser(String uid, String firstName, String lastName, String role, String phoneNum, String email) async {
    return await userCollection.doc(uid).set({
      'uid' : uid,
      'firstName' : firstName,
      'lastName' : lastName,
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
        firstName: doc.get('firstName') ?? " ",
        lastName: doc.get('lastName') ?? " ", 
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
      firstName: snapshot.get("firstName"),
      lastName: snapshot.get("lastName"), 
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
  
  //Stream for specific UserData
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
  
  //Stream for Queue
  Stream<QuerySnapshot> get queue {
    return queueCollection.snapshots();
  }
  
}
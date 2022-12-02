import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String? uid;
  DatabaseService({this.uid});
  
  //Collection Reference
  final CollectionReference queueCollection = FirebaseFirestore.instance.collection("queue");
  
  Future updateUserData(String plateNumber, String driverName, String inQueue, int passengerCount) async {
    return await queueCollection.doc(uid).set({
      'plateNumber' : plateNumber,
      'driverName' : driverName,
      'inQueue' : inQueue,
      'passengerCount' : passengerCount,
    });
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:puvoms/models/payment_model.dart';
import 'package:puvoms/models/queue_collection_model.dart';
import 'package:puvoms/models/test_model.dart';
import 'package:puvoms/models/user_collection_model.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/models/vehicle_model.dart';

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
  
  //reference to the vehicle collections
  final CollectionReference vehicleCollection = FirebaseFirestore.instance.collection("vehicles");
  
  //reference to the payment collections
  final CollectionReference paymentCollection = FirebaseFirestore.instance.collection("payments");
  
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
  
  Future updateQueueStatus(String uid, bool inQueue, DateTime queueStart, String firstName, String lastName, String plateNumber) async {
    return await queueCollection.doc(uid).update({
      'uid' : uid,
      'inQueue' : inQueue,
      'queueStart' : queueStart,
      'firstName' : firstName,
      'lastName' : lastName,
      'plateNumber' : plateNumber
    });
  }
  
  Future addPassenger(String queueUID, int passengerCount) async {
    return await queueCollection.doc(queueUID).update({
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
   
  Future updateUser(String uid, String firstName, String lastName, String phoneNum) async {
    return await userCollection.doc(uid).update({
      'uid' : uid,
      'firstName' : firstName,
      'lastName' : lastName,
      'phoneNum' : phoneNum
    });
  }
  
  Future createVehicle(String uid, String vehicleBrand, String vehicleColor, String plateNumber, DateTime queueStart) async {
    return await vehicleCollection.doc(uid).set({
      'uid' : uid,
      'vehicleBrand' : vehicleBrand,
      'vehicleColor' : vehicleColor,
      'plateNumber' : plateNumber,
      'queueStart' : queueStart
    });
  }
  
  Future updateVehicle(String uid, DateTime queueStart) async {
    return await vehicleCollection.doc(uid).update({
      'queueStart' : queueStart
    });
  }
  
  Future createPayment(String userUID, String passengerName, DateTime datePaid, String driverName, String queueUID, String vehicleBrand, String vehicleColor, String plateNumber) async {
    return await paymentCollection.add({
      'userUID' : userUID,
      'passengerName' : passengerName,
      'datePaid' : datePaid,
      'driverName' : driverName,
      'queueUID' : queueUID,
      'vehicleBrand' : vehicleBrand,
      'vehicleColor' : vehicleColor,
      'plateNumber' : plateNumber
    });
  }
    
  
  
  //creating a list of payments from a snapshot
  List<PaymentCollection> _paymentsListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return PaymentCollection(
        userUID: doc.get('userUID'),
        passengerName: doc.get('passengerName'),
        datePaid: doc.get('datePaid').toDate(),
        queueUID: doc.get('queueUID'),
        driverName: doc.get('driverName'),
        vehicleBrand: doc.get('vehicleBrand'),
        vehicleColor: doc.get('vehicleColor'),
        plateNumber: doc.get('plateNumber')
      );
    }).toList()..sort((p1, p2) => p1.datePaid.compareTo(p2.datePaid));
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
  
  //creating a list of the queue from the snapshot
  List<QueueCollection> _queueListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return QueueCollection(
        uid: doc.get('uid') ?? " ", 
        inQueue: doc.get('inQueue') ?? false, 
        queueStart: doc.get('queueStart').toDate() ?? DateTime.now(), 
        firstName: doc.get('firstName') ?? " ", 
        lastName: doc.get('lastName') ?? " ", 
        plateNumber: doc.get('plateNumber') ?? " ", 
        passengerCount: doc.get('passengerCount') ?? 0
        );
        //thiw will now sort the list by queue.
    }).toList()..sort((q1, q2) => q1.queueStart.compareTo(q2.queueStart));
  }
  
  //list of vehicles format
  List<VehicleCollection> _vehicleListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return VehicleCollection(
        uid: doc.get('uid') ?? " ", 
        vehicleBrand: doc.get('vehicleBrand') ?? " ", 
        vehicleColor: doc.get('vehicleColor') ?? " ", 
        plateNumber: doc.get('plateNumber') ?? " ", 
        queueStart: doc.get('queueStart').toDate()
      );
    }).toList()..sort((v1, v2) => v1.queueStart.compareTo(v2.queueStart));
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
  
  //Create an Object from a snapshot
  QueueData _queueDataFromSnapshot(DocumentSnapshot snapshot){
    return QueueData(
      uid: uid!, 
      inQueue: snapshot.get("inQueue"), 
      //firestore gives back timestamp
      queueStart: snapshot.get("queueStart").toDate(), 
      firstName: snapshot.get("firstName"), 
      lastName: snapshot.get("lastName"), 
      plateNumber: snapshot.get("plateNumber"), 
      passengerCount: snapshot.get("passengerCount")
    );
  }
  
  //Create an Object from a snaphot
  VehicleData _vehicleDataFromSnapshot(DocumentSnapshot snapshot){
    return VehicleData(
      uid: uid!,
      vehicleBrand: snapshot.get("vehicleBrand"),
      vehicleColor: snapshot.get("vehicleColor"),
      plateNumber: snapshot.get("plateNumber"),
      queueStart: snapshot.get("queueStart").toDate()
    );
  }
  
  //getting queuestatus only
  QueueData _statusData(DocumentSnapshot snapshot){
    return QueueData(
      uid: uid!,
      inQueue: snapshot.get("inQueue"),
    );
  }
  
  //Stream for all payment list
  Stream<List<PaymentCollection>> get paymentsList{
    return paymentCollection.snapshots()
    .map(_paymentsListFromSnapshot);
  }
  
  //for passengers and admin
  Stream<List<PaymentCollection>> getUserPaymentsList(String userUID){
    return paymentCollection.where("userUID", isEqualTo: userUID).snapshots()
    .map(_paymentsListFromSnapshot);
  }
  
  //for drivers
  Stream<List<PaymentCollection>> getDriverPaymentsList(String queueUID){
    return paymentCollection.where("queueUID", isEqualTo: queueUID).snapshots()
    .map(_paymentsListFromSnapshot);
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
  Stream<QueueData> get queueData {
    return queueCollection.doc(uid).snapshots()
    .map(_queueDataFromSnapshot);
  }
  
  //For Role Only?
  Stream<QueueData> get queueStatus {
    return queueCollection.doc(uid).snapshots()
    .map(_statusData);
  }
  
  //Stream for Queuelist
  Stream<List<QueueCollection>> get queueList {
    return queueCollection.snapshots()
    .map(_queueListFromSnapshot);
  }
  
  //Stream for Vehicle Data
  Stream<VehicleData> get vehicleData{
    return vehicleCollection.doc(uid).snapshots()
    .map(_vehicleDataFromSnapshot);
  }
  
  //Stream for Vehicle List
  Stream<List<VehicleCollection>> get vehicleList{
    return vehicleCollection.snapshots()
    .map(_vehicleListFromSnapshot);
  }
}
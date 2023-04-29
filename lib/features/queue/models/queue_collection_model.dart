class QueueCollection {
  final String uid;
  final bool inQueue;
  final DateTime queueStart;
  final String firstName;
  final String lastName;
  final String plateNumber;
  final int passengerCount;
  
  QueueCollection({
    required this.uid,
    required this.inQueue,
    required this.queueStart,
    required this.firstName,
    required this.lastName,
    required this.plateNumber,
    required this.passengerCount,
  });
}

class QueueData {
  final String? uid;
  final bool? inQueue;
  final DateTime? queueStart;
  final String? firstName;
  final String? lastName;
  final String? plateNumber;
  final int? passengerCount;
  
  QueueData({
    this.uid,
    this.inQueue,
    this.queueStart,
    this.firstName,
    this.lastName,
    this.plateNumber,
    this.passengerCount,
  });
}

//       'uid' : uid,
//       'inQueue' : inQueue,
//       'queueStart' : queueStart,
//       'firstName' : firstName,
//       'lastName' : lastName,
//       'plateNumber' : plateNumber,
//       'passengerCount' : passengerCount
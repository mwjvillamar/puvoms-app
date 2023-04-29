class PaymentData {
  final String? userUID;
  final String? passengerName;
  final DateTime? datePaid;
  final String? queueUID;
  final String? driverName;
  final String? vehicleBrand;
  final String? vehicleColor;
  final String? plateNumber;
  
  PaymentData({
    this.userUID,
    this.passengerName,
    this.datePaid,
    this.queueUID,
    this.driverName,
    this.vehicleBrand,
    this.vehicleColor,
    this.plateNumber
  });
}

class PaymentCollection {
  final String userUID;
  final String passengerName;
  final DateTime datePaid;
  final String queueUID;
  final String driverName;
  final String vehicleBrand;
  final String vehicleColor;
  final String plateNumber;
  
  PaymentCollection({
    required this.userUID,
    required this.passengerName,
    required this.datePaid,
    required this.queueUID,
    required this.driverName,
    required this.vehicleBrand,
    required this.vehicleColor,
    required this.plateNumber
  });
}
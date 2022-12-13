class VehicleData {
  final String? uid;
  final String? vehicleBrand;
  final String? vehicleColor;
  final String? plateNumber;
  final DateTime? queueStart;
  
  VehicleData({
    this.uid,
    this.vehicleBrand,
    this.vehicleColor,
    this.plateNumber,
    this.queueStart
  });
}

class VehicleCollection {
  final String uid;
  final String vehicleBrand;
  final String vehicleColor;
  final String plateNumber;
  final DateTime queueStart;
  
  VehicleCollection({
    required this.uid,
    required this.vehicleBrand,
    required this.vehicleColor,
    required this.plateNumber,
    required this.queueStart
  });
}
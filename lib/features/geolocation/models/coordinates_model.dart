class CoordinatesList {
  final String driverUID;
  final String driverName;
  final double latitude;
  final double longitude;
  final bool inQueue;
  
  CoordinatesList({
    required this.driverUID,
    required this.driverName,
    required this.latitude,
    required this.longitude,
    required this.inQueue
  });
}
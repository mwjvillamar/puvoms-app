import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/features/geolocation/models/coordinates_model.dart';

class AdminGeolocationMap extends StatefulWidget {
  const AdminGeolocationMap({super.key});

  @override
  State<AdminGeolocationMap> createState() => _AdminGeolocationMapState();
}

class _AdminGeolocationMapState extends State<AdminGeolocationMap> {
  
  final Set<Marker> markers = new Set();
  
  @override
  Widget build(BuildContext context) {
    
    final coordinatesList = Provider.of<List<CoordinatesList>>(context);
    
    for (var coordinatesList in coordinatesList) {
      debugPrint(coordinatesList.driverUID);
      debugPrint(coordinatesList.driverName);
      debugPrint(coordinatesList.latitude.toString());
      debugPrint(coordinatesList.longitude.toString());
      debugPrint(coordinatesList.inQueue.toString());
      
      markers.add(Marker(
        markerId: MarkerId(coordinatesList.driverUID),
        position: LatLng(coordinatesList.latitude, coordinatesList.longitude),
        infoWindow: InfoWindow(title: coordinatesList.driverName),
        icon: coordinatesList.inQueue ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue) 
        : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose)
      ));
    }
    
    return GoogleMap(
        markers: markers,
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: LatLng(14.74910917016755, 120.97379971115177),
          zoom: 14.4746,
        ));
  }
}

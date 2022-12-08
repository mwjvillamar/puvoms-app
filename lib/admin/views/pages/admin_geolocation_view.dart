import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AdminGeolocationView extends StatefulWidget {
  const AdminGeolocationView({Key? key}) : super(key: key);

  @override
  State<AdminGeolocationView> createState() => _AdminGeolocationViewState();
}

class _AdminGeolocationViewState extends State<AdminGeolocationView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    

    // TODO: implement build

    return const GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
        target: LatLng(14.74910917016755, 120.97379971115177),
        zoom: 14.4746,
        )
      );
  }
}

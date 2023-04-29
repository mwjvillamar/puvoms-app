import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/features/geolocation/views/pages/admin_geolocation_map.dart';
import 'package:puvoms/features/geolocation/models/coordinates_model.dart';
import 'package:puvoms/services/database.dart';

class PassengerGeolocationView extends StatefulWidget {
  const PassengerGeolocationView({Key? key}) : super(key: key);

  @override
  State<PassengerGeolocationView> createState() => _PassengerGeolocationViewState();
}

class _PassengerGeolocationViewState extends State<PassengerGeolocationView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return StreamProvider<List<CoordinatesList>>.value(
      value: DatabaseService().coordinatesList,
      initialData: const [],
      child: AdminGeolocationMap() 
    );
  }
}

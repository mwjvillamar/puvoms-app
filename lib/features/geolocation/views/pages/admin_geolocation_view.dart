import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/features/geolocation/views/pages/admin_geolocation_map.dart';
import 'package:puvoms/features/geolocation/models/coordinates_model.dart';
import 'package:puvoms/services/database.dart';

class AdminGeolocationView extends StatefulWidget {
  const AdminGeolocationView({Key? key}) : super(key: key);

  @override
  State<AdminGeolocationView> createState() => _AdminGeolocationViewState();
}

class _AdminGeolocationViewState extends State<AdminGeolocationView> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> list = <Marker>{};
  List<String> listDocuments = [];

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

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverGeolocationView extends StatefulWidget {
  const DriverGeolocationView({Key? key}) : super(key: key);

  @override
  State<DriverGeolocationView> createState() => _DriverGeolocationViewState();
}

class _DriverGeolocationViewState extends State<DriverGeolocationView> {

  Completer<GoogleMapController> controller = Completer();

  late BitmapDescriptor originIcon;
  late BitmapDescriptor destinationIcon;

  Set<Marker> marker = <Marker>{};

  late LatLng currentLocation;
  late LatLng destinationLocation;

  LatLng origin = const LatLng(14.7473944,120.9733941);
  LatLng destination = const LatLng(14.6540828,120.9837599);
  Set<Polyline> polyline = <Polyline>{};
  List<LatLng> coordinates = [];
  PolylinePoints? polylinePoints;

  /////////////////////////////////////////////////////////
  void setInitialLocation() {
    currentLocation = LatLng(
      origin.latitude,
      origin.longitude
    );
    destinationLocation = LatLng(
      destination.latitude,
      destination.longitude
    );
  }

  /////////////////////////////////////////////////////////
  void showPinsOnMap() {
    marker.add(Marker(
      markerId: const MarkerId('originPin'),
      position: currentLocation,
      icon: originIcon,
    ));

    marker.add(Marker(
      markerId: const MarkerId('destinationPin'),
      position: destinationLocation,
      icon: destinationIcon,
    ));
  }

  /////////////////////////////////////////////////////////
  void setOriginAndDestinationMarkerIcons() async {
    originIcon = BitmapDescriptor.defaultMarker;
    destinationIcon = BitmapDescriptor.defaultMarker;
  }

  /////////////////////////////////////////////////////////
  void setPolylines() async {
    PolylineResult? result = await polylinePoints?.getRouteBetweenCoordinates(
        "AIzaSyB-_D7baXyS2b6Xharz6lmjL41mUJmMkMw",
        PointLatLng(
            currentLocation.latitude,
            currentLocation.longitude
        ),
        PointLatLng(
            destinationLocation.latitude,
            destinationLocation.longitude
        )
    );

    if (result?.status == 'OK') {
      result?.points.forEach((PointLatLng pointLatLng) {
        coordinates.add(
            LatLng(
                pointLatLng.latitude,
                pointLatLng.longitude
            )
        );
      });
      setState(() {
        polyline.add(
            Polyline(
                polylineId: const PolylineId('polyline'),
                color: Colors.black,
                points: coordinates
            )
        );
      });
    }

  }

  @override
  void initState() {

    // setup initial locations
    setInitialLocation();

    // setup marker icons
    setOriginAndDestinationMarkerIcons();

    polylinePoints = PolylinePoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return GoogleMap(
        mapType: MapType.normal,
        markers: marker,
        polylines: polyline,
        onMapCreated: (GoogleMapController controller) {
          showPinsOnMap();
          setPolylines();
        },
        initialCameraPosition: CameraPosition(
          target: origin,
          zoom: 16,
        )
      );
  }

}

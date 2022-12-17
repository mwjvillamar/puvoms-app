import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:puvoms/shared/load_view.dart';

class DriverGeolocationView extends StatefulWidget {
  const DriverGeolocationView({Key? key}) : super(key: key);

  @override
  State<DriverGeolocationView> createState() => _DriverGeolocationViewState();
}

class _DriverGeolocationViewState extends State<DriverGeolocationView> {

  late Future data;

  Completer<GoogleMapController> controller = Completer();

  late BitmapDescriptor currentIcon;
  late BitmapDescriptor destinationIcon;

  Set<Marker> marker = <Marker>{};

  LatLng currentLocation = const LatLng(14.7473944,120.9733941);
  LatLng destinationLocation = const LatLng(14.6540828,120.9837599);

  PolylinePoints? polylinePoints;
  Set<Polyline> polyline = <Polyline>{};
  List<LatLng> coordinates = [];

  // GET LOCATION METHOD
  Future<Position> getCurrentLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permission');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      forceAndroidLocationManager: true
    );
  }

  void setCurrentLocation() {
    getCurrentLocation().then((location) {
      setState(() {
        currentLocation = LatLng(location.latitude, location.longitude);
      });
    });
  }

  // LOCATION UPDATER
  void liveLocation() {
    LocationOptions locationOptions = const LocationOptions(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream().listen((Position position) {
      //debugPrint(position == null ? 'Unknown' : "Position ButtCheeks " + position.latitude.toString() + ', ' + position.longitude.toString());
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
    });
  }

  // SET INITIAL LOCATION METHOD
  LatLng setInitialLocation() {
    currentLocation = LatLng(
      currentLocation.latitude,
      currentLocation.longitude
    );

    return currentLocation;
  }

  // SET MARKER ICONS METHOD
  void setMarkerIcons() async {
    currentIcon = BitmapDescriptor.defaultMarker;
    destinationIcon = BitmapDescriptor.defaultMarker;
  }

  // SET POLYLINES METHOD
  void setPolylines() {
    polylinePoints = PolylinePoints();
  }

  // SHOW MARKERS ON MAP METHOD
  void showMarkersOnMap() async {
    marker.add(Marker(
      markerId: const MarkerId('positionMarker'),
      position: currentLocation,
      icon: currentIcon,
    ));

    marker.add(Marker(
      markerId: const MarkerId('destinationMarker'),
      position: destinationLocation,
      icon: destinationIcon,
    ));
  }

  // SHOW POLYLINES ON MAP METHOD
  void showPolylinesOnMap() async {
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
                color: Colors.blueAccent,
                points: coordinates,
                width: 5
            )
        );
      });
    }
  }

  //////////////////////////////////////////////////////////////
  @override
  void initState() {
    data = getCurrentLocation();
    setCurrentLocation();

    setPolylines();
    setMarkerIcons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GoogleMap(
              mapType: MapType.normal,
              markers: marker,
              polylines: polyline,
              onMapCreated: (GoogleMapController controller) {
                showPolylinesOnMap();
                showMarkersOnMap();
              },
              initialCameraPosition: CameraPosition(
                target: setInitialLocation(),
                //cant wait for change in value so it gets initial value
                zoom: 16,
              ),
            );
          } else {
            return const LoadView();
          }
        });
  }
}

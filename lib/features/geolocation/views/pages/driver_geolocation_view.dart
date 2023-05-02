import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/features/queue/models/user_model.dart';
import 'package:puvoms/services/database.dart';
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

  Set<Marker> markers = <Marker>{};

  LatLng currentLocation = const LatLng(14.7473944, 120.9733941);
  LatLng destinationLocation = const LatLng(14.6540828, 120.9837599);

  PolylinePoints? polylinePoints;
  Set<Polyline> polylines = <Polyline>{};
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
      return Future.error(
          'Location permissions are permanently denied, we cannot request permission');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true);
  }

  void setCurrentLocation() {
    getCurrentLocation().then((location) {
      setState(() {
        currentLocation = LatLng(location.latitude, location.longitude);
      });
    });
  }

  // LOCATION UPDATER
  liveLocation() {
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
    
    return currentLocation;
  }

  // SET INITIAL LOCATION METHOD
  LatLng setInitialLocation() {
    currentLocation =
        LatLng(currentLocation.latitude, currentLocation.longitude);

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
    markers.add(Marker(
      markerId: const MarkerId('positionMarker'),
      position: currentLocation,
      icon: currentIcon,
    ));

    markers.add(Marker(
      markerId: const MarkerId('destinationMarker'),
      position: destinationLocation,
      icon: destinationIcon,
    ));
  }

  // SHOW POLYLINES ON MAP METHOD
  void showPolylinesOnMap() async {
    PolylineResult? result = await polylinePoints?.getRouteBetweenCoordinates(
        "AIzaSyB-_D7baXyS2b6Xharz6lmjL41mUJmMkMw",
        PointLatLng(currentLocation.latitude, currentLocation.longitude),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));

    if (result?.status == 'OK') {
      result?.points.forEach((PointLatLng pointLatLng) {
        coordinates.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
      setState(() {
        polylines.add(Polyline(
            polylineId: const PolylineId('polyline'),
            color: Colors.blueAccent,
            points: coordinates,
            width: 5));
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
    final user = Provider.of<UserObject?>(context);

    // TODO: implement build

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user!.uid).userData,
        builder: (context, snapshot2) {
          if (snapshot2.hasData) {
            UserData? userData = snapshot2.data;
            var firstName = userData?.firstName;
            var lastName = userData?.lastName;
            return GoogleMap(
              onTap: (argument) {},
              mapType: MapType.normal,
              markers: markers,
              polylines: polylines,
              onMapCreated: (GoogleMapController controller) async {
                showPolylinesOnMap();
                showMarkersOnMap();
                await DatabaseService(uid: user.uid).createCoordinate(
                    user.uid!,
                    "$firstName $lastName",
                    currentLocation.latitude,
                    currentLocation.longitude,
                    false);
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
        }
    );
  }
}

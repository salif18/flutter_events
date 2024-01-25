import 'dart:async';

import 'package:events/screens/maps/consts.dart';
import 'package:events/screens/maps/widgets/mapsappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class EventsMaps extends StatefulWidget {
  const EventsMaps({Key? key}) : super(key: key);

  @override
  State<EventsMaps> createState() => _MyMapsState();
}

class _MyMapsState extends State<EventsMaps> {
  Location _locationController = Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(12.583459766044909, -7.9296775493922125), zoom: 14);

  Set<Marker> markers = {
    Marker(
      markerId: MarkerId("_currentLoction"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(12.583459766044909, -7.9296775493922125),
    ),
    Marker(
      markerId: MarkerId("_sourceLoction"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(12.583459766044909, -7.9296775493922125),
    ),
    Marker(
      markerId: MarkerId("_destinationLoction"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(12.583459766044909, -7.9296775493922125),
    )
  };

  //la position actuell
  LatLng? _currentPosition;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((__) => {
          getPolylinePoints().then((coordinates) => {
                generatePolyLineFromPoints(coordinates),
              }),
        });
  }

  Future<void> _cameraPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 14);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  //obtenir la position
  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraPosition(_currentPosition!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        GOOGLE_MAPS_API_KEY,
        PointLatLng(12.583459766044909, -7.9296775493922125),
        PointLatLng(11.583459766044909, -7.9296775493922125),
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MapsAppBAr(),
      body: _currentPosition == null
          ? Center(
              child: Text("Loading...",
                  style: GoogleFonts.roboto(fontSize: 25, color: Colors.white)),
            )
          : GoogleMap(
              initialCameraPosition: initialCameraPosition,
              markers: markers,
              polylines: Set<Polyline>.of(polylines.values),
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: ((GoogleMapController controller) =>
                  _mapController.complete(controller))),
    );
  }
}

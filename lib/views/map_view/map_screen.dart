import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shalontime/resources/constants/colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final Map<String, Marker> _markers = {};

  LocationData? currentLocation;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
  }

  static const CameraPosition _initialCamPos = CameraPosition(
    target: LatLng(25.439510, 81.849297),
    zoom: 14,
  );

  static const CameraPosition _goToCamPos = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(25.439510, 81.849297),
    zoom: 14,
  );

  addMarker(String id, LatLng location) {
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
        title: "Salon Time Shop 1",
        snippet: "Go have a Hair cut",
      ),
    );

    _markers[id] = marker;
    setState(() {});
  }

  addMultipleMarker() {
    for (int i = 0; i <= 1; i++) {
      addMarker(
        'test$i',
        i == 0 ? LatLng(25.439510, 81.849297) : LatLng(25.439510, 81.849999),
      );
    }
    _markers["c"] = Marker(
      markerId: MarkerId("c"),
      position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: _initialCamPos,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          addMultipleMarker();
        },
        markers: _markers.values.toSet(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text(''),
        icon: Icon(
          Icons.gps_fixed,
          color: primaryColor,
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_goToCamPos));
  }
}

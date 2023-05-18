import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';

class MapViewModel with ChangeNotifier {
  Position? currentLocation;
  // double lat = 0;
  //-----------------------get current location---------------//
  void getCurrentLocation() async {
    // Location location = Location();
    // await location.getLocation().then(
    //   (location) {
    //     currentLocation = location;
    //     lat = location.latitude!;
    //     print("5555555555555555 $currentLocation ==============");
    //   },
    // );
    // _goToTheLake;
    // setState(() {});

    currentLocation = await _determineUserCurrentPosition();
    print("============ $currentLocation ==============");
  }

  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if user enable service for location permission
    if (!isLocationServiceEnabled) {
      print("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();

    //check if user denied location and retry requesting for permission
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        print("user denied location permission");
      }
    }

    //check if user denied permission forever
    if (locationPermission == LocationPermission.deniedForever) {
      print("user denied permission forever");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  }
}

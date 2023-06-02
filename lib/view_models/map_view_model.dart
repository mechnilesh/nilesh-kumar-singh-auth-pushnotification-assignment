import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/resources/utils/utils.dart';
import 'package:shalontime/view_models/user_side_view_models/home_screen_view_model.dart';
// import 'package:location/location.dart';

class MapViewModel with ChangeNotifier {
  Position? currentLocation;
  String? draggedAddress;
  String? currentCityAndState;
  String? city;
  String? state;
  List<dynamic> operatingLocationsList = [];
  // double lat = 0;
  //-----------------------get current location---------------//
  Future<void> getCurrentLocation(BuildContext context) async {
    currentLocation = await _determineUserCurrentPosition();
    print("============ $currentLocation ==============");
    getCurrentLocationAndCheckForAailibilty(context);
  }

  //----------------get current location---------------------//
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

  //----------------------------get address---------------------//

  //get address from dragged pin
  Future getAddress(LatLng position, BuildContext context) async {
    //this will list down all address around the position
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placemarks[0]; // get only first and closest address
    String addresStr =
        "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}";

    draggedAddress = addresStr;
    currentCityAndState = "${address.locality}, ${address.administrativeArea}";
    city = address.locality!;
    state = address.administrativeArea!;

    print(city);
    print(state);

    notifyListeners();

    context.read<HomeScreenViewModel>().getSalonsNearBy(context, city!, state!);
  }

  //--------------get current location and check for availability------------//

  void getCurrentLocationAndCheckForAailibilty(BuildContext context) async {
    await getAddress(
            LatLng(currentLocation!.latitude, currentLocation!.longitude),
            context)
        .then((value) {
      getListOfAvailablePlaces(context);
    });
  }

  CollectionReference crm = FirebaseFirestore.instance.collection('crm');

  void getListOfAvailablePlaces(BuildContext context) async {
    // print(currentAddress);
    crm
        .doc("operating_locations")
        .get()
        .then((DocumentSnapshot<dynamic> snapshot) {
      operatingLocationsList = snapshot.data()["locations_list"];
      notifyListeners();
      if (operatingLocationsList
          .toString()
          .toLowerCase()
          .contains(currentCityAndState!.toLowerCase())) {
        Null;
      } else {
        Utils.showDialogUnavalableArea(context);
      }
    });
  }

  //----------------------------------For registration-----------------------//
}

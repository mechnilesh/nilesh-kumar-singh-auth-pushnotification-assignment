import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/view_models/map_view_model.dart';

import '../../view_models/seller_side_view_models/shop_register_view_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  // final Map<String, Marker> _markers = {};

  late LatLng _draggedLatlng;

  @override
  void initState() {
    _draggedLatlng = LatLng(
      context.read<MapViewModel>().currentLocation!.latitude,
      context.read<MapViewModel>().currentLocation!.longitude,
    );
    super.initState();
  }

  // LocationData? currentLocation;
  // double lat = 0;

  // @override
  // void initState() {
  //   // getCurrentLocation();
  //   super.initState();
  // }

  // void getCurrentLocation() async {
  //   Location location = Location();
  //   await location.getLocation().then(
  //     (location) {
  //       currentLocation = location;
  //       lat = location.latitude!;
  //       print("5555555555555555 $currentLocation ==============");
  //     },
  //   );
  //   // _goToTheLake;
  //   // setState(() {});
  // }

  // static const CameraPosition _initialCamPos = CameraPosition(
  //   target: LatLng(25.439510, 81.849297),
  //   zoom: 14,
  // );

  // static const CameraPosition _goToCamPos = CameraPosition(
  //   bearing: 192.8334901395799,
  //   target: LatLng(25.439510, 81.849297),
  //   zoom: 14,
  // );

  // addMarker(String id, LatLng location) {
  //   var marker = Marker(
  //     markerId: MarkerId(id),
  //     position: location,
  //     infoWindow: const InfoWindow(
  //       title: "Salon Time Shop 1",
  //       snippet: "Go have a Hair cut",
  //     ),
  //   );

  //   //   _markers[id] = marker;
  //   setState(() {});
  // }

  // addMultipleMarker() {
  //   // for (int i = 0; i <= 1; i++) {
  //   // addMarker(
  //   //   'test',
  //   //   LatLng(
  //   //     context.read<MapViewModel>().currentLocation!.latitude!,
  //   //     context.read<MapViewModel>().currentLocation!.longitude!,
  //   //   ),
  //   // );
  //   // }
  //   _markers["c"] = Marker(
  //     markerId: MarkerId("c"),
  //     position: LatLng(
  //       context.read<MapViewModel>().currentLocation!.latitude!,
  //       context.read<MapViewModel>().currentLocation!.longitude!,
  //     ),
  //   );
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 65),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: lightPurpleColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.arrow_back,
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        title: Text(
          "Set Salon Location",
          style: TextStyle(color: primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _goToCurrentLocation();
            },
            icon: Icon(
              Icons.my_location_rounded,
              color: primaryColor,
            ),
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Future<void> _goToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(
          context.read<MapViewModel>().currentLocation!.latitude,
          context.read<MapViewModel>().currentLocation!.longitude,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _getMap(),
        _getCustomPin(),
        _showDraggedAddress(),
        _confirmButtonLocation(),
      ],
    );
  }

  Widget _confirmButtonLocation() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: context
                .watch<MapViewModel>()
                .operatingLocationsList
                .toString()
                .toLowerCase()
                .contains(context
                    .watch<MapViewModel>()
                    .currentCityAndState!
                    .toLowerCase())
            ? ElevatedButton(
                onPressed: () {
                  // address, latitude, longitude of shop

                  context
                      .read<ShopRegisterVeiwModel>()
                      .salonAddressEditingController
                      .text = context.read<MapViewModel>().draggedAddress!;

                  context.read<ShopRegisterVeiwModel>().latitudeShop =
                      _draggedLatlng.latitude;

                  context.read<ShopRegisterVeiwModel>().longitudeShop =
                      _draggedLatlng.longitude;

                  context.read<ShopRegisterVeiwModel>().notifiListener();

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.9, 50),
                ),
                child: const Text(
                  "Confirm Location",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.9, 50),
                ),
                onPressed: () {},
                child: const Text(
                    "Currently we are not operating at this location"),
              ),
      ),
    );
  }

  Widget _showDraggedAddress() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Center(
            child: Text(
          context.read<MapViewModel>().draggedAddress.toString(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }

  Widget _getMap() {
    return GoogleMap(
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(
          context.read<MapViewModel>().currentLocation!.latitude,
          context.read<MapViewModel>().currentLocation!.longitude,
        ),
        zoom: 16,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        // addMultipleMarker();
      },
      // markers: _markers.values.toSet(),
      onCameraIdle: () {
        // _getAddress(_draggedLatlng);

        context.read<MapViewModel>().getAddress(_draggedLatlng,context);
      },
      onCameraMove: (cameraPosition) {
        //this function will trigger when user keep dragging on map
        //every time user drag this will get value of latlng
        _draggedLatlng = cameraPosition.target;
      },
    );
  }

  Widget _getCustomPin() {
    return Center(
      child: SizedBox(
        width: 120,
        child: Lottie.asset("assets/map/pin.json"),
      ),
    );
  }
}

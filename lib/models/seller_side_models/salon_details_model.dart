// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

SalonDetailsModel? globalSalonDetailsModel;

class SalonDetailsModel {
  final String salonName;
  final String gstNumber;
  final String salonAddress;
  final String ownerName;
  final String ownerMobile;
  final String ownerEmail;
  final bool salonOpenClose;
  final String uid;
  final double latitude;
  final double longitude;
  final Timestamp timestamp;
  final List<dynamic> listOfServices;
  //----------------------step 2--------------/
  SalonDetailsModel({
    required this.salonName,
    required this.gstNumber,
    required this.salonAddress,
    required this.ownerName,
    required this.ownerMobile,
    required this.ownerEmail,
    required this.salonOpenClose,
    required this.uid,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    required this.listOfServices,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'salonName': salonName,
      'gstNumber': gstNumber,
      'salonAddress': salonAddress,
      'ownerName': ownerName,
      'ownerMobile': ownerMobile,
      'ownerEmail': ownerEmail,
      'salonOpenClose': salonOpenClose,
      'uid': uid,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp,
      'listOfServices': listOfServices.map((x) => x.toMap()).toList(),
    };
  }

  factory SalonDetailsModel.fromSnapshot(DocumentSnapshot<dynamic> snapshot) {
    // Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return SalonDetailsModel(
      salonName: snapshot.data()['salonName'],
      gstNumber: snapshot.data()['gstNumber'],
      salonAddress: snapshot.data()['salonAddress'],
      ownerName: snapshot.data()['ownerName'],
      ownerMobile: snapshot.data()['ownerMobile'],
      ownerEmail: snapshot.data()['ownerEmail'],
      salonOpenClose: snapshot.data()['salonOpenClose'],
      uid: snapshot.data()['uid'],
      latitude: snapshot.data()['latitude'],
      longitude: snapshot.data()['longitude'],
      timestamp: snapshot.data()['timestamp'],
      listOfServices: snapshot.data()['listOfServices'],
    );
  }

  String toJson() => json.encode(toMap());
}

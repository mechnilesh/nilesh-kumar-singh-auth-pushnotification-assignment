// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shalontime/models/seller_side_models/service_model.dart';

class SellerRegisterModel {
  final String salonName;
  final String gstNumber;
  final String salonAddress;
  final String salonCity;
  final String salonState;
  final String ownerName;
  final String ownerMobile;
  final String ownerEmail;
  final bool salonOpenClose;
  final bool isVerfied;
  final String uid;
  final double latitude;
  final double longitude;
  final FieldValue timestamp;
  final List<ServicesModel> listOfServices;
  //----------------------step 2--------------/
  SellerRegisterModel({
    required this.salonName,
    required this.gstNumber,
    required this.salonAddress,
    required this.salonCity,
    required this.salonState,
    required this.ownerName,
    required this.ownerMobile,
    required this.ownerEmail,
    required this.salonOpenClose,
    required this.isVerfied,
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
      'salonCity': salonCity,
      'salonState': salonState,
      'ownerName': ownerName,
      'ownerMobile': ownerMobile,
      'ownerEmail': ownerEmail,
      'salonOpenClose': salonOpenClose,
      'uid': uid,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp,
      'isVerfied': isVerfied,
      'listOfServices': listOfServices.map((x) => x.toMap()).toList(),
    };
  }

  factory SellerRegisterModel.fromMa(Map<String, dynamic> map) {
    return SellerRegisterModel(
      salonName: map['salonName'] as String,
      gstNumber: map['gstNumber'] as String,
      salonAddress: map['salonAddress'] as String,
      salonCity: map['salonCity'] as String,
      salonState: map['salonState'] as String,
      ownerName: map['ownerName'] as String,
      ownerMobile: map['ownerMobile'] as String,
      ownerEmail: map['ownerEmail'] as String,
      salonOpenClose: map['salonOpenClose'] as bool,
      isVerfied: map['isVerfied'] as bool,
      uid: map['uid'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      timestamp: map['timestamp'],
      listOfServices: List<ServicesModel>.from(
        (map['listOfServices'] as List<int>).map<ServicesModel>(
          (x) => ServicesModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory SellerRegisterModel.fromSnapshot(DocumentSnapshot<dynamic> snapshot) {
    // Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return SellerRegisterModel(
      isVerfied: snapshot.data()['isVerfied'],
      salonName: snapshot.data()['salonName'],
      gstNumber: snapshot.data()['gstNumber'],
      salonAddress: snapshot.data()['salonAddress'],
      salonCity: snapshot.data()['salonCity'],
      salonState: snapshot.data()['salonState'],
      ownerName: snapshot.data()['ownerName'],
      ownerMobile: snapshot.data()['ownerMobile'],
      ownerEmail: snapshot.data()['ownerEmail'],
      salonOpenClose: snapshot.data()['salonOpenClose'],
      uid: snapshot.data()['uid'],
      latitude: snapshot.data()['latitude'],
      longitude: snapshot.data()['longitude'],
      timestamp: snapshot.data()['timestamp'],
      listOfServices:
          List<ServicesModel>.from(snapshot.data()['listOfServices']),
    );
  }

  String toJson() => json.encode(toMap());
}

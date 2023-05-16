// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shalontime/models/seller_side_models/service_model.dart';

class SellerRegisterModel {
  final String salonName;
  final String gstNumber;
  final String salonAddress;
  final String ownerName;
  final String ownerMobile;
  final String ownerEmail;
  final String uid;
  final List<ServiceModel> listOfServices;
  //----------------------step 2--------------/
  SellerRegisterModel({
    required this.salonName,
    required this.gstNumber,
    required this.salonAddress,
    required this.ownerName,
    required this.ownerMobile,
    required this.ownerEmail,
    required this.uid,
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
      'uid': uid,
      'listOfServices': listOfServices.map((x) => x.toMap()).toList(),
    };
  }

  factory SellerRegisterModel.fromMap(Map<String, dynamic> map) {
    return SellerRegisterModel(
      salonName: map['salonName'] as String,
      gstNumber: map['gstNumber'] as String,
      salonAddress: map['salonAddress'] as String,
      ownerName: map['ownerName'] as String,
      ownerMobile: map['ownerMobile'] as String,
      ownerEmail: map['ownerEmail'] as String,
      uid: map['uid'] as String,
      listOfServices: List<ServiceModel>.from(
        (map['listOfServices'] as List<int>).map<ServiceModel>(
          (x) => ServiceModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SellerRegisterModel.fromJson(String source) =>
      SellerRegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

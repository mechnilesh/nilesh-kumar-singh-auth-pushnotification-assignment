// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserDataModel? globalUserDataModel;

class UserDataModel {
  final String email;
  final String name;
  final String city;
  final String gender;
  final String token;
  final String uid;
  final bool isSeller;
  final bool registrationStatus;

  UserDataModel({
    required this.email,
    required this.name,
    required this.city,
    required this.gender,
    required this.token,
    required this.uid,
    required this.isSeller,
    required this.registrationStatus,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'city': city,
      'gender': gender,
      'token': token,
      'uid': uid,
      'isSeller': isSeller,
      "registrationStatus": registrationStatus,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
        email: map['email'] as String,
        name: map['name'] as String,
        city: map['city'] as String,
        gender: map['gender'] as String,
        token: map['token'] as String,
        uid: map['uid'] as String,
        isSeller: map['isSeller'] as bool,
        registrationStatus: map['registrationStatus'] as bool);
  }

  factory UserDataModel.fromSnapshot(DocumentSnapshot<dynamic> snapshot) {
    return UserDataModel(
      email: snapshot.data()["email"],
      name: snapshot.data()["name"],
      city: snapshot.data()["city"],
      gender: snapshot.data()["gender"],
      token: snapshot.data()["token"],
      uid: snapshot.data()["uid"],
      isSeller: snapshot.data()["isSeller"],
      registrationStatus: snapshot.data()["registrationStatus"],
    );
  }

  
  String toMap() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

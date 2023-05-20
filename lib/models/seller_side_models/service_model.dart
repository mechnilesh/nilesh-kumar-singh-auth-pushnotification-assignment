import 'dart:convert';

// ServicesModel? globalServicesModel;

class ServicesModel {
  final String serviceName;
  final String servicePrice;
  final String serviceDuration;
  final String serviceDescription;
  ServicesModel({
    required this.serviceName,
    required this.servicePrice,
    required this.serviceDuration,
    required this.serviceDescription,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serviceName': serviceName,
      'servicePrice': servicePrice,
      'serviceDuration': serviceDuration,
      'serviceDescription': serviceDescription,
    };
  }

  factory ServicesModel.fromMap(Map<String, dynamic> map) {
    return ServicesModel(
      serviceName: map['serviceName'] as String,
      servicePrice: map['servicePrice'] as String,
      serviceDuration: map['serviceDuration'] as String,
      serviceDescription: map['serviceDescription'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServicesModel.fromJson(String source) =>
      ServicesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

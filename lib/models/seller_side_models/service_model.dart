import 'dart:convert';

class ServiceModel {
  final String serviceName;
  final String servicePrice;
  final String serviceDuration;
  final String serviceDescription;
  ServiceModel({
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

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      serviceName: map['serviceName'] as String,
      servicePrice: map['servicePrice'] as String,
      serviceDuration: map['serviceDuration'] as String,
      serviceDescription: map['serviceDescription'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) =>
      ServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

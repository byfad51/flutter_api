// To parse this JSON data, do
//
//     final address = addressFromMap(jsonString);

import 'dart:convert';

class Address {
  int id;
  String firstname;
  String lastname;
  String city;
  String district;
  String neighbourhood;
  String fullAddress;
  String postalCode;
  String phoneNumber;

  Address({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.city,
    required this.district,
    required this.neighbourhood,
    required this.fullAddress,
    required this.postalCode,
    required this.phoneNumber,
  });

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    city: json["city"],
    district: json["district"],
    neighbourhood: json["neighbourhood"],
    fullAddress: json["fullAddress"],
    postalCode: json["postalCode"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "city": city,
    "district": district,
    "neighbourhood": neighbourhood,
    "fullAddress": fullAddress,
    "postalCode": postalCode,
    "phoneNumber": phoneNumber,
  };
}

// To parse this JSON data, do
//
//     final donor = donorFromJson(jsonString);

import 'dart:convert';

List<Donor> donorFromJson(String str) =>
    List<Donor>.from(json.decode(str).map((x) => Donor.fromJson(x)));

String donorToJson(List<Donor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Donor {
  Donor({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.location,
    required this.bloodGroup,
  });

  int id;
  String name;
  String? email;
  String? phone;
  String? location;
  String bloodGroup;

  factory Donor.fromJson(Map<String, dynamic> json) => Donor(
        id: json["id"],
        name: json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        location: json["location"] == null ? null : json["location"],
        bloodGroup: json["blood_group"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        if (email != null) "email": email,
        if (phone != null) "phone": phone,
        if (location != null) "location": location,
        "blood_group": bloodGroup,
      };
}

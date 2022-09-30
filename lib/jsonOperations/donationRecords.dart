// To parse this JSON data, do
//
//     final donor = donorFromJson(jsonString);

import 'dart:convert';

List<Record> recordsFromJson(String str) =>
    List<Record>.from(json.decode(str).map((x) => Record.fromJson(x)));

String recordsToJson(List<Record> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Record {
  Record({
    required this.date,
    required this.donorId,
    this.details,
    this.donorName,
    required this.id,
    this.location,
    this.locationId,
  });

  String date;
  String? details;
  int donorId;
  String? donorName;
  int id;
  String? location;
  int? locationId;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        date: json["date"],
        details: json["details"],
        donorId: json["donor_id"],
        donorName: json["donor_name"],
        id: json["id"],
        location: json["location"],
        locationId: json["location_id"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "details": details,
        "donor_id": donorId,
        "donor_name": donorName,
        "id": id,
        "location": location,
        "location_id": locationId,
      };
}

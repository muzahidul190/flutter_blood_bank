import 'dart:convert';

List<Location> locationFromJson(String str) =>
    List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(List<Location> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
  Location({
    required this.id,
    required this.locationName,
  });

  int id;
  String locationName;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        locationName: json["location_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location_name": locationName,
      };
}

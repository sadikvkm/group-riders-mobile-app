// To parse this JSON data, do
//
//     final tripList = tripListFromJson(jsonString);

import 'dart:convert';

List<TripList> tripListFromJson(String str) => List<TripList>.from(json.decode(str).map((x) => TripList.fromJson(x)));

String tripListToJson(List<TripList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TripList {
  TripList({
    this.id,
    this.tripNumber,
    this.name,
    this.createdAt,
  });

  String? id;
  String? tripNumber;
  String? name;
  DateTime? createdAt;

  factory TripList.fromJson(Map<String, dynamic> json) => TripList(
    id: json["id"],
    tripNumber: json["tripNumber"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tripNumber": tripNumber,
    "name": name,
    "createdAt": createdAt?.toIso8601String(),
  };
}

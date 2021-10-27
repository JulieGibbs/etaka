// To parse this JSON data, do
//
//     final offers = offersFromJson(jsonString);

import 'dart:convert';

List<Offer> offersFromJson(String str) =>
    List<Offer>.from(json.decode(str).map((x) => Offer.fromJson(x)));

String offersToJson(List<Offer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Offer {
  Offer({
    required this.id,
    required this.title,
    required this.details,
    required this.startDatetime,
    required this.endDatetime,
    required this.location,
  });

  int id;
  String title;
  String details;
  DateTime startDatetime;
  DateTime endDatetime;
  String location;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        title: json["title"],
        details: json["details"],
        startDatetime: DateTime.parse(json["start_datetime"]),
        endDatetime: DateTime.parse(json["end_datetime"]),
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "details": details,
        "start_datetime": startDatetime.toIso8601String(),
        "end_datetime": endDatetime.toIso8601String(),
        "location": location,
      };
}

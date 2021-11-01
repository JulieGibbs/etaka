// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

import 'dart:convert';

List<Offer> offerFromJson(String str) =>
    List<Offer>.from(json.decode(str).map((x) => Offer.fromJson(x)));

String offerToJson(List<Offer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Offer {
  Offer({
    required this.id,
    required this.title,
    required this.details,
    required this.startDatetime,
    required this.endDatetime,
    this.photo,
    required this.location,
  });

  int id;
  String title;
  String details;
  DateTime startDatetime;
  DateTime endDatetime;
  String? photo;
  String location;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        title: json["title"],
        details: json["details"],
        startDatetime: DateTime.parse(json["start_datetime"]),
        endDatetime: DateTime.parse(json["end_datetime"]),
        photo: json["photo"] == null ? null : json["photo"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "details": details,
        "start_datetime": startDatetime.toIso8601String(),
        "end_datetime": endDatetime.toIso8601String(),
        "photo": photo == null ? null : photo,
        "location": location,
      };
}

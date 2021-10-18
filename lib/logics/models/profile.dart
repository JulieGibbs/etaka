// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.id,
    required this.balance,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    this.email = "",
    required this.nid,
    required this.pin,
  });

  int id;
  double balance;
  String firstName;
  String lastName;
  String mobile;
  String email;
  String nid;
  String pin;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        balance: json["balance"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        mobile: json["mobile"],
        email: json["email"],
        nid: json["nid"],
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "balance": balance,
        "first_name": firstName,
        "last_name": lastName,
        "mobile": mobile,
        "email": email,
        "nid": nid,
        "pin": pin,
      };
}

// To parse this JSON data, do
//
//     final merchant = merchantFromJson(jsonString);

import 'dart:convert';

List<Merchant> merchantFromJson(String str) =>
    List<Merchant>.from(json.decode(str).map((x) => Merchant.fromJson(x)));

String merchantToJson(List<Merchant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Merchant {
  Merchant({
    required this.id,
    required this.orgName,
    required this.merchantType,
    required this.tradeLic,
    required this.balance,
    this.photo,
    required this.user,
  });

  int id;
  String orgName;
  String merchantType;
  String tradeLic;
  double balance;
  String? photo;
  String user;

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        id: json["id"],
        orgName: json["org_name"],
        merchantType: json["merchant_type"],
        tradeLic: json["trade_lic"],
        balance: json["balance"],
        photo: json["photo"] == null ? null : json["photo"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "org_name": orgName,
        "merchant_type": merchantType,
        "trade_lic": tradeLic,
        "balance": balance,
        "photo": photo == null ? null : photo,
        "user": user,
      };
}

// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

List<Transaction> transactionFromJson(String str) => List<Transaction>.from(
    json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionToJson(List<Transaction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
  Transaction({
    required this.transId,
    required this.transType,
    required this.amount,
    required this.datetime,
    required this.user,
  });

  String transId;
  String transType;
  double amount;
  DateTime datetime;
  int user;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        transId: json["trans_id"],
        transType: json["trans_type"],
        amount: json["amount"],
        datetime: DateTime.parse(json["datetime"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "trans_id": transId,
        "trans_type": transType,
        "amount": amount,
        "datetime": datetime.toIso8601String(),
        "user": user,
      };
}

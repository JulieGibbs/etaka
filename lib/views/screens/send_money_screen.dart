import 'package:etaka/logics/models/profile.dart';
import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:etaka/views/components/toast.dart';
import 'package:etaka/views/screens/send_money_confirmation.dart';
import 'package:flutter/material.dart';

class SendMoneyScreen extends StatefulWidget {
  final Profile profile;
  const SendMoneyScreen({Key? key, required this.profile}) : super(key: key);

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  late String receiver;
  late double amount;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: Text(
              "Send Money",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          
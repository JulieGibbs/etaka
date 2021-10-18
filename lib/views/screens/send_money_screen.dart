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
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  receiver = val;
                });
              },
              decoration: InputDecoration(
                  hintText: "88017xxxxxxxx",
                  labelText: "Enter Receiver Number"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 10,
            ),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  amount = double.parse(val);
                });
              },
              decoration:
                  InputDecoration(hintText: "1000", labelText: "Enter Amount"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 5, 5),
            child: Text(
              "Available Balance: ${widget.profile.balance.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                child: Text('SEND'),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: primaryColor,
              ),
              onPressed: () {
                SendMoney();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => SendMoneyConfirmation()));
              },
            ),
          )
        ],
      ),
    );
  }

  void SendMoney() {
    if (widget.profile.balance < amount) {
      error_toast("Insufficient funds");
      return;
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SendMoneyConfirmation(receiver: receiver, amount: amount)));
    }
  }
}

import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:etaka/views/components/toast.dart';
import 'package:etaka/views/screens/transaction_successfull.dart';
import 'package:flutter/material.dart';

class SendMoneyConfirmation extends StatefulWidget {
  final String receiver;
  final double amount;
  const SendMoneyConfirmation(
      {Key? key, required this.receiver, required this.amount})
      : super(key: key);

  @override
  _SendMoneyConfirmationState createState() => _SendMoneyConfirmationState();
}

class _SendMoneyConfirmationState extends State<SendMoneyConfirmation> {
  double charge = 5;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CustomScaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Send Money",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.black,
                //   width: 1,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text("Receiver : ${widget.receiver}",
                      style: TextStyle(fontSize: 20))),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.black,
                //   width: 1,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                      "Amount: ${widget.amount.toStringAsFixed(2)}    Charge:+${charge.toStringAsFixed(2)}     Total: ${(widget.amount + charge).toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 14))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 15, 50, 5),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "******",
              labelText: "Enter Pin",
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
              child: Text('CONFIRM'),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: primaryColor,
            ),
            onPressed: () async {
              await sendmoney();
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => TransactionSuccessful()));
            },
          ),
        )
      ],
    ));
  }

  Future<void> sendmoney() async {
    APIService api = APIService();
    bool ch = await api.SendMoney(widget.receiver, widget.amount + charge);
    if (ch) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => TransactionSuccessful()));
    } else {
      error_toast("Transaction Failed");
    }
  }
}

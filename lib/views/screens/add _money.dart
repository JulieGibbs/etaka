import 'package:etaka/logics/models/profile.dart';
import 'package:etaka/logics/services/payment_gateway.dart';
import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:etaka/views/components/toast.dart';
import 'package:flutter/material.dart';

class AddMoneyScreen extends StatefulWidget {
  final Profile profile;
  const AddMoneyScreen({Key? key, required this.profile}) : super(key: key);

  @override
  _AddMoneyScreenState createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
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
              "Add Money",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
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
                child: Text('Continue'),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: primaryColor,
              ),
              onPressed: () {
                AddMoney();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => AddMoneyConfirmation()));
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> AddMoney() async {
    if (0 < amount) {
      print('Pressed');
      Payment payment = Payment();
      bool ch = await payment.gotoSSL(amount);
      if (ch) {
        success_toast("Add Money Successful");
        Navigator.pop(context);
      } else {
        error_toast("Failed to Add Money");
      }
      return;
    } else {
      error_toast("Invalid Amount");
    }
  }
}

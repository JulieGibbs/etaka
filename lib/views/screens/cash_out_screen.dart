import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class CashOutScreen extends StatefulWidget {
  const CashOutScreen({Key? key}) : super(key: key);

  @override
  _CashOutScreenState createState() => _CashOutScreenState();
}

class _CashOutScreenState extends State<CashOutScreen> {
  late String agent, pin;
  late double amount;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Text(
              "Cash Out",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: TextField(
              onChanged: (val) {
                agent = val;
              },
              decoration: InputDecoration(
                  hintText: "017xxxxxxxx", labelText: "Enter Agent Number"),
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
                amount = double.parse(val);
              },
              decoration:
                  InputDecoration(hintText: "1000", labelText: "Enter Amount"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: TextField(
              onChanged: (val) {
                pin = val;
              },
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
        ],
      ),
    );
  }
}

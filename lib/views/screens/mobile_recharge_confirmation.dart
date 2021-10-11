import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class MobileRechargeConfirmation extends StatefulWidget {
  const MobileRechargeConfirmation({Key? key}) : super(key: key);

  @override
  _MobileRechargeConfirmationState createState() =>
      _MobileRechargeConfirmationState();
}

class _MobileRechargeConfirmationState
    extends State<MobileRechargeConfirmation> {
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
            "Mobile Recharge",
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
                  child: Text("Receiver : 01704293600",
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
                      "Amount: 5,000     Charge:+10.00     Total: 5,010",
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MobileRechargeConfirmation()));
            },
          ),
        )
      ],
    ));
  }
}

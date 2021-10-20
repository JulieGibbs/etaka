import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionFailed extends StatefulWidget {
  const TransactionFailed({Key? key}) : super(key: key);

  @override
  TransactionFailedState createState() => TransactionFailedState();
}

class TransactionFailedState extends State<TransactionFailed> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 170,
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            child: Stack(
              children: [
                Image.asset("assets/img/cancel.png"),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Text(
              "Transaction Failed",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Center(
              child: Text("There is an error.Please try again later",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ))),
          SizedBox(
            height: 100,
          ),
          Center(
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                child: Text('Back'),
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
                        builder: (context) => TransactionFailed()));
              },
            ),
          )
        ],
      ),
    );
  }
}

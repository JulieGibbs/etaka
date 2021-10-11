import 'package:etaka/components/constant.dart';
import 'package:etaka/components/reuseable_widgets.dart';
import 'package:etaka/screens/send_money_confirmation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionSuccessful extends StatefulWidget {
  const TransactionSuccessful({Key? key}) : super(key: key);

  @override
  TransactionSuccessfulState createState() => TransactionSuccessfulState();
}

class TransactionSuccessfulState extends State<TransactionSuccessful> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
          ),

          Container(
            alignment: Alignment.bottomCenter,
            width: 50,
            height: 50,
            child: Stack(
              children: [
                Image.asset("assets/img/checked.png"),

              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),

            child: Text(
              "Transaction Successful!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: TextField(
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
                        builder: (context) => SendMoneyConfirmation()));
              },
            ),
          )
        ],
      ),
    );
  }
}

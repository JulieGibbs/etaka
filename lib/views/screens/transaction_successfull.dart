import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

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
            height: 150,
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
          Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 1,
                  // ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text(""" Receiver : 01704293600\n
         Amount : 5,010\n 
Available Balance : 10,000""", maxLines: 20, style: TextStyle(fontSize: 20))),
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
                child: Text('Go Back To Home'),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: primaryColor,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
          )
        ],
      ),
    );
  }
}

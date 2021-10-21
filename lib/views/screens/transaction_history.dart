import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(
          height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 0),
            child: Text(
            "Transaction History",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            )

         ],
        ),

    );
  }
}

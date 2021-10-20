import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction {
  String name;
  double point;
  int createdMillis;

  Transaction(
      {required this.name, required this.point, required this.createdMillis});
}

List<Transaction> transactions = List.generate(20, (index) {
  var random = new Random();
  bool isRedeem = random.nextBool();
  String name = isRedeem ? "Redeem PS" : "Awarded Point";
  double point = isRedeem ? -140000.0 : (random.nextInt(9) + 1) * 100.0;
  return Transaction(
      name: name,
      point: point,
      createdMillis: DateTime.now()
          .add(Duration(
            days: -random.nextInt(7),
            hours: -random.nextInt(23),
            minutes: -random.nextInt(59),
          ))
          .millisecondsSinceEpoch);
})
  ..sort((v1, v2) => v2.createdMillis - v1.createdMillis);

class TransactionPage extends StatefulWidget {
  TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        brightness: Theme.of(context).brightness,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "Transaction History",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: buildListView(),
    );
  }

  ListView buildListView() {
    String prevDay = "";
    String today = DateFormat("EEE, MMM d, y").format(DateTime.now());
    String yesterday = DateFormat("EEE, MMM d, y")
        .format(DateTime.now().add(Duration(days: -1)));

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        Transaction transaction = transactions[index];
        DateTime date =
            DateTime.fromMillisecondsSinceEpoch(transaction.createdMillis);
        String dateString = DateFormat("EEE, MMM d, y").format(date);

        if (today == dateString) {
          dateString = "Today";
        } else if (yesterday == dateString) {
          dateString = "Yesteday";
        }

        bool showHeader = prevDay != dateString;
        prevDay = dateString;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            showHeader
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Text(
                      dateString,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  )
                : Offstage(),
            buildItem(index, context, date, transaction),
          ],
        );
      },
    );
  }

  Widget buildItem(
      int index, BuildContext context, DateTime date, Transaction transaction) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(width: 20),
          buildLine(index, context),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            // color: Theme.of(context).accentColor,
            child: Text(
              DateFormat("hh:mm a").format(date),
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    // color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            flex: 1,
            child: buildItemInfo(transaction, context),
          ),
        ],
      ),
    );
  }

  Card buildItemInfo(Transaction transaction, BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: transaction.point.isNegative
                  ? [Colors.deepOrange, Colors.red]
                  : [Colors.green, Colors.teal]),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  transaction.name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                NumberFormat("###,###,#### P").format(transaction.point),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildLine(int index, BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: 2,
              color: Theme.of(context).accentColor,
            ),
          ),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor, shape: BoxShape.circle),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 2,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}

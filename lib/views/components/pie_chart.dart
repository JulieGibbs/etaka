import 'package:etaka/logics/models/transaction.dart';
import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'constant.dart';

class PieChartSample2 extends StatefulWidget {
  final int send;
  final int cashout;
  final int recharge;
  final int billpay;

  const PieChartSample2(
      {Key? key,
      required this.send,
      required this.cashout,
      required this.recharge,
      required this.billpay})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => PieChartSample2State();
}

class PieChartSample2State extends State<PieChartSample2> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    var send;
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          height: 120,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              }),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 30,
              sections: showingSections(
                send: widget.send,
                cashout: widget.cashout,
                recharge: widget.recharge,
                billpay: widget.billpay,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(
      {send, cashout, recharge, billpay}) {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 30.0 : 15.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            showTitle: isTouched,
            color: const Color(0xff0293ee),
            value: double.parse(send.toString()),
            title: '${double.parse(send.toString())}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            showTitle: isTouched,
            color: const Color(0xfff8b250),
            value: double.parse(recharge.toString()),
            title: '${double.parse(recharge.toString())}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            showTitle: isTouched,
            color: const Color(0xff13d38e),
            value: double.parse(billpay.toString()),
            title: '${double.parse(billpay.toString())}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final Color textColor;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color,
            ),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ),
    );
  }
}

class IndicatorRow extends StatelessWidget {
  final double send;
  final double cashout;
  final double recharge;
  final double billpay;
  const IndicatorRow(
      {Key? key,
      required this.send,
      required this.cashout,
      required this.recharge,
      required this.billpay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Indicator(
            color: Color(0xff0293ee),
            text:
                '${(((send) / (send + cashout + recharge + billpay)) * 100).toStringAsFixed(0)}% Send Money',
          ),
          Indicator(
            color: const Color(0xfff8b250),
            text:
                '${(((recharge) / (send + cashout + recharge + billpay)) * 100).toStringAsFixed(0)}% Recharge',
          ),
          Indicator(
            color: const Color(0xff13d38e),
            text:
                '${(((billpay) / (send + cashout + recharge + billpay)) * 100).toStringAsFixed(0)}% Bill Pay',
          ),
        ],
      ),
    );
  }
}

class ExpenseWidget extends StatefulWidget {
  const ExpenseWidget({Key? key}) : super(key: key);

  @override
  _ExpenseWidgetState createState() => _ExpenseWidgetState();
}

class _ExpenseWidgetState extends State<ExpenseWidget> {
  late List<Transaction> trns;
  late String start_date, stop_date;
  late double expense = 0, send = 0, recharge = 0, cashout = 0, billpay = 0;
  bool isLoading = true;
  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<List<Transaction>> getdata() async {
    APIService api = APIService();
    var data = await api.gettranHistory();
    trns = transactionFromJson(data);
    print(trns.length);
    for (int i = 0; i < trns.length; i++) {
      if (trns[i].transType == "SEND") {
        send = send + trns[i].amount;
      } else if (trns[i].transType == "CASHOUT") {
        cashout = cashout + trns[i].amount;
      } else if (trns[i].transType == "RECHARGE") {
        recharge = recharge + trns[i].amount;
      } else if (trns[i].transType == "BILLPAY") {
        billpay = billpay + trns[i].amount;
      }
    }
    stop_date = trns.first.datetime.toString();
    start_date = trns.last.datetime.toString();
    print("======PIE CHART====");
    print(billpay);
    setState(() {
      isLoading = false;
    });
    return trns;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFFEEF2F8),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expenses".toUpperCase(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "${DateFormat('yyyy-MMM-dd').format(DateTime.parse(start_date))} - ${DateFormat('yyyy-MMM-dd').format(DateTime.parse(start_date))}",
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "BDT ${send + cashout + recharge + billpay}",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  !isLoading
                      ? Container(
                          height: 130,
                          width: 130,
                          child: PieChartSample2(
                            recharge: (((recharge) /
                                        (send + recharge + cashout + billpay)) *
                                    100)
                                .toInt(),
                            send: (((send) /
                                        (send + recharge + cashout + billpay)) *
                                    100)
                                .toInt(),
                            cashout: (((cashout) /
                                        (send + recharge + cashout + billpay)) *
                                    100)
                                .toInt(),
                            billpay: (((billpay) /
                                        (send + recharge + cashout + billpay)) *
                                    100)
                                .toInt(),
                          ))
                      : blue_loading,
                ],
              ),
              IndicatorRow(
                  recharge: recharge,
                  send: send,
                  cashout: cashout,
                  billpay: billpay)
            ],
          ),
        ),
      ),
    );
  }
}

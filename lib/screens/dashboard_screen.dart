import 'package:etaka/components/constant.dart';
import 'package:etaka/components/pie_chart.dart';
import 'package:etaka/components/reuseable_widgets.dart';
import 'package:etaka/screens/send_money_screen.dart';
import 'package:flutter/material.dart';

import 'cash_out_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.topRight,
          color: Color(0xFF005CEE),
          child: Column(
            children: [
              SafeArea(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("BDT 24,000",
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("active balance".toUpperCase(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.6))),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    child: Text(' + Add Money',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                  Spacer(),
                  ClipOval(
                    child: Material(
                      color: Colors
                          .transparent, //To let the Container background be displayed
                      child: IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors
                          .transparent, //To let the Container background be displayed
                      child: IconButton(
                          icon: Icon(
                            Icons.account_circle_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                DashBoardMainItemCard(
                  asset: "assets/svg/Sendmoney.svg",
                  title: "SEND MONEY",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SendMoneyScreen()));
                  },
                ),
                DashBoardMainItemCard(
                  asset: "assets/svg/Cashout.svg",
                  title: "CASH OUT",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CashOutScreen()));
                  },
                ),
                DashBoardMainItemCard(
                  asset: "assets/svg/Recharge.svg",
                  title: "RECHARGE",
                  onTap: () {},
                ),
                DashBoardMainItemCard(
                  asset: "assets/svg/Scan.svg",
                  title: "PAY NOW",
                  onTap: () {},
                ),
              ])
            ],
          ),
        ),
        SizedBox(),
        Container(
            decoration: BoxDecoration(color: Color(0xFFEEF2F8)),
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        "Pay Bills".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87.withOpacity(0.8)),
                      ),
                      Spacer(),
                      ClipOval(
                        child: Material(
                          color: Colors
                              .transparent, //To let the Container background be displayed
                          child: IconButton(
                              icon: Icon(Icons.arrow_forward_ios_rounded,
                                  color: Colors.black87, size: 20),
                              onPressed: () {}),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PayBillsItem(
                        asset: "assets/img/electricity.png",
                        title: "Electricity"),
                    PayBillsItem(asset: "assets/img/gas.png", title: "Gas"),
                    PayBillsItem(asset: "assets/img/water.png", title: "Water"),
                    PayBillsItem(
                        asset: "assets/img/education.png", title: "Education")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PayBillsItem(
                        asset: "assets/img/internet.png", title: "Internet"),
                    PayBillsItem(
                        asset: "assets/img/credit-card.png",
                        title: "Credit Card"),
                    PayBillsItem(
                        asset: "assets/img/telephone.png", title: "Telephone"),
                    PayBillsItem(asset: "assets/img/tv.png", title: "TV")
                  ],
                )
              ],
            )),
        SizedBox(height: 10),
        Padding(
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
                              "1 Sep 2021 - 30 Sep 2021",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "BDT 26,600",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                          height: 130, width: 130, child: PieChartSample2()),
                    ],
                  ),
                  IndicatorRow()
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

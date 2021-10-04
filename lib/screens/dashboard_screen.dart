import 'package:etaka/components/pie_chart.dart';
import 'package:etaka/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

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
          height: 240,
          color: Color(0xFF005CEE),
          child: Column(
            children: [
              SafeArea(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("BDT 24,000",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("active balance".toUpperCase(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.6))),
                      ],
                    ),
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                DashBoardMainItemCard(
                  asset: "assets/svg/Sendmoney.svg",
                  title: "SEND MONEY",
                  onTap: () {},
                ),
                DashBoardMainItemCard(
                  asset: "assets/svg/Cashout.svg",
                  title: "CASH OUT",
                  onTap: () {},
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
                        "Pay Bills",
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
                        asset: "assets/img/logo_2.png", title: "Electricity"),
                    PayBillsItem(
                        asset: "assets/img/logo_2.png", title: "Electricity"),
                    PayBillsItem(
                        asset: "assets/img/logo_2.png", title: "Electricity"),
                    PayBillsItem(
                        asset: "assets/img/logo_2.png", title: "Electricity")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PayBillsItem(
                        asset: "assets/img/logo_2.png", title: "Electricity"),
                    PayBillsItem(
                        asset: "assets/img/logo_2.png", title: "Electricity"),
                    PayBillsItem(
                        asset: "assets/img/logo_2.png", title: "Electricity"),
                    PayBillsItem(
                        asset: "assets/img/logo_2.png", title: "Electricity")
                  ],
                )
              ],
            )),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFEEF2F8),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Expenses"),
                    Spacer(),
                    Container(
                        height: 200, width: 200, child: PieChartSample2()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

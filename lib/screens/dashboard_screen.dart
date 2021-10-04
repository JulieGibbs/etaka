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
          )
        ]));
  }
}

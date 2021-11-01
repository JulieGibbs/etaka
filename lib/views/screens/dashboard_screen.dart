import 'package:etaka/logics/models/profile.dart';
import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/pie_chart.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:etaka/views/screens/send_money_screen.dart';
import 'package:flutter/material.dart';

import 'add _money.dart';
import 'bill_payment_screen.dart';
import 'cash_out_screen.dart';
import 'mobile_recharge_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Profile profile;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  Future<void> getdata() async {
    APIService api = APIService();
    var data = await api.getProfileData();
    String loc = await api.getLocationCity();
    print(loc.toUpperCase());

    profile = Profile.fromJson(data);
    setState(() {
      isLoading = false;
    });
  }

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
                  isLoading
                      ? loading
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("BDT ${profile.balance.toStringAsFixed(2)}",
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
                    onPressed: () async {
                      var c = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddMoneyScreen(
                                    profile: profile,
                                  )));
                      await getdata();
                      setState(() {});
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
                            builder: (context) => SendMoneyScreen(
                                  profile: profile,
                                )));
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MobileRechargeScreen()));
                  },
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BillPayment(
                              type: 'ELEC',
                            ),
                          ),
                        );
                      },
                      child: PayBillsItem(
                          asset: "assets/img/electricity.png",
                          title: "Electricity"),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BillPayment(
                                type: 'GAS',
                              ),
                            ),
                          );
                        },
                        child: PayBillsItem(
                            asset: "assets/img/gas.png", title: "Gas")),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BillPayment(
                                type: 'WAT',
                              ),
                            ),
                          );
                        },
                        child: PayBillsItem(
                            asset: "assets/img/water.png", title: "Water")),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BillPayment(
                              type: 'EDU',
                            ),
                          ),
                        );
                      },
                      child: PayBillsItem(
                          asset: "assets/img/education.png",
                          title: "Education"),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BillPayment(
                              type: 'NET',
                            ),
                          ),
                        );
                      },
                      child: PayBillsItem(
                          asset: "assets/img/internet.png", title: "Internet"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BillPayment(
                              type: 'CARD',
                            ),
                          ),
                        );
                      },
                      child: PayBillsItem(
                          asset: "assets/img/credit-card.png",
                          title: "Credit Card"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BillPayment(
                              type: 'TEL',
                            ),
                          ),
                        );
                      },
                      child: PayBillsItem(
                          asset: "assets/img/telephone.png",
                          title: "Telephone"),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BillPayment(
                                type: 'TV',
                              ),
                            ),
                          );
                        },
                        child: PayBillsItem(
                            asset: "assets/img/tv.png", title: "TV"))
                  ],
                )
              ],
            )),
        SizedBox(height: 10),
        ExpenseWidget()
      ]),
    );
  }
}

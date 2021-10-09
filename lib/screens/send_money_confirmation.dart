import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class SendMoneyConfirmation extends StatefulWidget {
  const SendMoneyConfirmation({Key? key}) : super(key: key);

  @override
  _SendMoneyConfirmationState createState() => _SendMoneyConfirmationState();
}

class _SendMoneyConfirmationState extends State<SendMoneyConfirmation> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Money"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.account_balance))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: h,
                width: w,
                child: Image.asset("assets/img/bck_r.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    children: [
                      Image.asset("assets/img/vector_1_r.png"),
                      Image.asset("assets/img/vector_2_r.png"),
                    ],
                  ),
                )
              ],
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                  ),

                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "To",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 340,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text("Number: 01704293600", style: TextStyle(fontSize: 20))
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 340,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text("Amount: 5,000     Charge:+10.00     Total: 5,010", style: TextStyle(fontSize: 14))
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Enter Pin",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(hintText: "******"),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 80,
                            child: Image.asset("assets/img/submit_button.jpg"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

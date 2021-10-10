import 'package:etaka/components/constant.dart';
import 'package:etaka/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

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
                  CustomBackButton(),
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    // color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Send Money",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
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
                              height: 60,
                              decoration: BoxDecoration(
                                // border: Border.all(
                                //   color: Colors.black,
                                //   width: 1,
                                // ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("Receiver : 01704293600",
                                      style: TextStyle(fontSize: 20))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                // border: Border.all(
                                //   color: Colors.black,
                                //   width: 1,
                                // ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                      "Amount: 5,000     Charge:+10.00     Total: 5,010",
                                      style: TextStyle(fontSize: 14))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 15, 50, 5),
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
                              padding:
                                  const EdgeInsets.fromLTRB(40, 15, 40, 15),
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
                                      builder: (context) =>
                                          SendMoneyConfirmation()));
                            },
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

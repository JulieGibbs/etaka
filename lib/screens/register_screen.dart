import 'package:etaka/components/constant.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      padding: EdgeInsets.all(12),
                      height: 83,
                      child: Image.asset("assets/img/logo_2.png")),
                  Container(
                    // color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 0, 10),
                          child: Text(
                            "Into Your eTaka Wallet",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    hintText: "+8801774000000",
                                    labelText: "Phone Number"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    hintText: "Enter First Name",
                                    labelText: "First Name"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    hintText: "Enter Last Name",
                                    labelText: "Last Name"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    hintText: "Enter Your Email",
                                    labelText: "Email (Optional)"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    hintText: "Enter Your NID Number",
                                    labelText: "NID"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "******",
                              labelText: "Pin",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "******",
                              labelText: "Confirm Pin",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Center(
                          child: ElevatedButton(
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 250,
                              child: Text('Register',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: primaryColor,
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             SendMoneyConfirmation()));
                            },
                          ),
                        ),
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

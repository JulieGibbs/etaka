import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

import 'otp_screen.dart';

class InitialLogin extends StatefulWidget {
  const InitialLogin({Key? key}) : super(key: key);

  @override
  _InitialLoginState createState() => _InitialLoginState();
}

class _InitialLoginState extends State<InitialLogin> {
  late String phone_number;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isRoot: true,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 180),
            Container(
                padding: EdgeInsets.all(12),
                height: 83,
                child: Image.asset("assets/img/logo_2.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Register / Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                        onChanged: (val) {
                          setState(() {
                            phone_number = val;
                          });
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "+8801774000000",
                            labelText: "Phone Number"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                CustomPrimaryButton(
                    btnText: "Continue",
                    onTap: () async {
                      APIService api = APIService();
                      await api.login(phone_number);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPScreen(
                                    phone_number: phone_number,
                                  )));
                    })
              ],
            ),
          ]),
    );
  }
}

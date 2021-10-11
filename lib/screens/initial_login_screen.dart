import 'package:etaka/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class InitialLogin extends StatelessWidget {
  const InitialLogin({Key? key}) : super(key: key);

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
                CustomPrimaryButton(btnText: "Continue", onTap: () {})
              ],
            ),
          ]),
    );
  }
}
